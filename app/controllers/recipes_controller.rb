class RecipesController < ApplicationController
  before_action :get_recipe, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :home, :show, :category, :get_recipe, :recipe_params]

  def index
    if params[:query].present?
      @recipes = policy_scope(Recipe).search_by_title_and_ingredients_and_author(params[:query])
    else
      @recipes = policy_scope(Recipe).order(created_at: :asc)
    end
    authorize @recipes
  end

  def new
    @recipe = Recipe.new(user: current_user, ingredients: "<ul><li></li></ul>", description: "<ul><li></li></ul>", photo: "<img src='https://www.agora-gallery.com/advice/wp-content/uploads/2015/10/image-placeholder.png'</img>")
    @recipe.author = current_user.username if current_user
    authorize @recipe
  end

  def show
    authorize @recipe
  end

  def edit
    authorize @recipe
  end

  def update
    authorize @recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def create
    params = recipe_params
    params['category'] = Category.find(recipe_params[:category_id])
    @recipe = Recipe.new(params)
    @recipe.user = current_user
    authorize @recipe
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def home
    @recipes = Recipe.all
    @categories = Category.all
    authorize @recipes
  end

  def user_recipes
    @recipes = Recipe.where(user_id: current_user.id)
    authorize @recipes
    render 'index'
  end

  private

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :description, :author, :photo, :category_id, :user_id)
  end

end
