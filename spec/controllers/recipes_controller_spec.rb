require 'rails_helper'
begin
  require "recipes_controller"
rescue LoadError
end

if defined?(RecipesController)
  RSpec.describe RecipesController, :type => :controller do
    let(:valid_attributes) do
      {
        title: "Breaded fish",
        ingredients: "A fish, breadcrumbs, eggs, and flour",
        description: "Prepare the breading: Prep the breadcrumbs, eggs, and flour. Bread the fish. Bake in the oven",
        author: "Mr Cook",
        category: "Desserts"
      }
    end

    let(:invalid_attributes) do
      {
        title: nil,
        ingredients: nil,
        description: nil,
        author: nil,
        category: nil
      }
    end

    describe "GET index" do
      it "assigns all recipes as @recipes" do
        recipe = Recipe.create! valid_attributes
        get :index, params: {}
        expect(assigns(:recipes)).to eq([recipe])
      end
    end

    describe "GET show" do
      it "assigns the requested recipe as @recipe" do
        recipe = Recipe.create! valid_attributes
        get :show, params: {:id => recipe.to_param}
        expect(assigns(:recipe)).to eq(recipe)
      end
    end

    describe "GET new" do
      it "assigns a new recipe as @recipe" do
        get :new, params: {}
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end
    end

    describe "POST create" do
      describe "with valid parameters"
        it "creates a new Recipe" do
          expect {
            post :create, params: {:recipe => valid_attributes}
          }.to change(Recipe, :count).by(1)
        end

        it "assigns a newly created recipe to @recipe" do
          post :create, params: {:recipe => valid_attributes}
          expect(assigns(:recipe)).to be_a(Recipe)
          expect(assigns(:recipe)).to be_persisted
        end

        it "redirects to the created recipe" do
          post :create, params: {:recipe => valid_attributes}
          expect(response).to redirect_to(Recipe.last)
        end
      end

    describe "with invalid params" do
      it "assigns a newly created but unsaved recipe as @recipe" do
        post :create, params: {:recipe => invalid_attributes}
        expect(assigns(:recipe)).to be_a_new(Recipe)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:recipe => invalid_attributes}
        expect(response). to render_template("new")
      end
    end

  end

else
  describe "RecipesController" do
    it "should exist" do
      expect(defined?(RecipesController)).to eq(true)
    end
  end
end
