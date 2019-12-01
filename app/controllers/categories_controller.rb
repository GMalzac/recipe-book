class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @category = Category.find(params[:id])
    @recipes = Recipe.where(category: @category)
    authorize @category
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
