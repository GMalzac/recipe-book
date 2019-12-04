class RecipesController < ApplicationController
  before_action :get_recipe, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :home, :show, :category, :get_recipe, :recipe_params]

  def index
    @recipes = policy_scope(Recipe).order(created_at: :asc)
    authorize @recipes
  end

  def new
    @recipe = Recipe.new(user: current_user)
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
    params['category'] = Category.find(recipe_params[:category].to_i)
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

  private

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :description, :author, :category)
  end

end
