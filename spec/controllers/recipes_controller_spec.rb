require 'rails_helper'

begin
  require "recipes_controller"
rescue LoadError
end
# Check that one policy actually work in here and then test all policies in the policy folder

if defined?(RecipesController)
  RSpec.describe RecipesController, :type => :controller do

    let(:valid_attributes) do
      {
        title: "Breaded fish",
        ingredients: "A fish, breadcrumbs, eggs, and flour",
        description: "Prepare the breading: Prep the breadcrumbs, eggs, and flour. Bread the fish. Bake in the oven",
        author: "Mr Cook",
        category_id: create(:random_category).id
      }
    end

    let(:valid_attributes_with_user) do
      {
        title: "Breaded fish",
        ingredients: "A fish, breadcrumbs, eggs, and flour",
        description: "Prepare the breading: Prep the breadcrumbs, eggs, and flour. Bread the fish. Bake in the oven",
        author: "Mr Cook",
        category_id: create(:random_category).id,
        user_id: create(:random_user).id
      }
    end

    let(:invalid_attributes) do
      {
        title: nil,
        ingredients: "A fish, breadcrumbs, eggs, and flour",
        description: "Prepare the breading: Prep the breadcrumbs, eggs, and flour. Bread the fish. Bake in the oven",
        author: "Mr Cook",
        category_id: create(:random_category).id,
        user_id: create(:random_user).id
      }
    end


    describe "a logged in user" do
      login_user

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      describe "GET index" do
        it "should return success" do
          get :index, params: {}
          expect(response.status).to eq 200
        end
      end

      describe "GET new" do
        it "should return success" do
          get :new, params: {}
          expect(response.status).to eq 200
        end
        it "assigns a new recipe as @recipe" do
          get :new, params: {}
          expect(assigns(:recipe)).to be_a_new(Recipe)
        end
      end

      # TO DO: regroup all the POST create tests in one to avoid making many different post requests
      # Add a self-explanatory error message for each expectation (check if exists in Rspec)

      describe "POST create" do
        describe "with valid parameters" do
          it "should return redirect" do
            post :create, params: { :recipe => valid_attributes }
            expect(response.status).to eq 302
          end
          it 'redirects to recipes#show' do
            post :create, params: {:recipe => valid_attributes }
            expect(response).to redirect_to(recipe_path(assigns(:recipe)))
          end
          it "creates a new Recipe" do
            expect {
              post :create, params: {:recipe => valid_attributes }
            }.to change(Recipe, :count).by(1)
          end
          it "assigns a newly created recipe to @recipe" do
            post :create, params: {:recipe => valid_attributes }
            expect(assigns(:recipe)).to be_a(Recipe)
            expect(assigns(:recipe)).to be_persisted
          end
          it "redirects to the created recipe" do
            post :create, params: {:recipe => valid_attributes}
            expect(response).to redirect_to(Recipe.last)
          end
        end

        describe "with invalid params" do
          it "should return success" do
            post :create, params: { :recipe => invalid_attributes }
            expect(response.status).to eq 200
          end
          it "assigns a newly created but unsaved recipe as @recipe" do
            post :create, params: {:recipe => invalid_attributes}
            expect(assigns(:recipe)).to be_a_new(Recipe)
          end
          it "re-renders the 'new' template" do
            post :create, params: {:recipe => invalid_attributes}
            expect(response).to render_template("new")
          end
        end
      end

      describe "GET show" do
        it "should return success" do
          recipe = Recipe.create!(valid_attributes_with_user)
          get :show, params: { :id => recipe.to_param }
          expect(response.status).to eq 200
        end
        it "assigns the requested recipe as @recipe" do
          recipe = Recipe.create!(valid_attributes_with_user)
          get :show, params: { :id => recipe.to_param }
          expect(assigns(:recipe)).to eq(recipe)
        end
      end

      describe "GET edit" do
        it "should return success" do
          recipe = Recipe.new(valid_attributes)
          recipe.user_id = subject.current_user.id
          recipe.save
          get :edit, params: { id: recipe.id }
          expect(response.status).to eq 200
        end
        it "should allow a publisher to edit his recipe" do
          recipe = Recipe.new(valid_attributes)
          recipe.user_id = subject.current_user.id
          recipe.save
          get :edit, params: {:id => recipe.to_param}
          expect(response).to render_template("edit")

        end

        it "should not allow a user to edit somebody else's recipe" do
          recipe = Recipe.create!(valid_attributes_with_user)
          expect do
            get :edit, params: {:id => recipe.to_param}
          end.to raise_error Pundit::NotAuthorizedError
        end
      end

    end

    describe "a non-logged in user" do

      it "should not have a current_user" do
        # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
        expect(subject.current_user).to eq(nil)
      end

      describe "GET index" do
        it "should return success" do
          get :index, params: {}
          expect(response.status).to eq 200
        end
      end

      describe "GET new" do
        it "should return redirect" do
          get :new, params: {}
          expect(response.status).to eq 302
        end
        it "should redirect to login page" do
          get :new, params: {}
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "POST create" do
        it "should return redirect" do
          post :create, params: {}
          expect(response.status).to eq 302
        end
        it "should redirect to login page" do
          get :new, params: {}
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET show" do
        it "assigns the requested recipe as @recipe" do
          recipe = Recipe.create!(valid_attributes_with_user)
          get :show, params: {:id => recipe.to_param}
          expect(assigns(:recipe)).to eq(recipe)
        end
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
