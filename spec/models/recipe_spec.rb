require 'rails_helper'

RSpec.describe Recipe, :type => :model do

  let(:recipe_1) { build(:recipe) }

  describe "Associations" do
    it 'belongs_to user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs_to category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(recipe_1).to be_valid
    end

    it "is not valid without title" do
      recipe2 = build(:recipe, title: nil)
      expect(recipe2).to_not be_valid
    end

    it "is not valid without ingredients" do
      recipe2 = build(:recipe, ingredients: nil)
      expect(recipe2).to_not be_valid
    end

    it "is not valid without description" do
      recipe2 = build(:recipe, description: nil)
      expect(recipe2).to_not be_valid
    end

    it "is not valid without author" do
      recipe2 = build(:recipe, author: nil)
      expect(recipe2).to_not be_valid
    end

    it "is not valid without user" do
      recipe2 = build(:recipe, user: nil)
      expect(recipe2).to_not be_valid
    end

    it "is not valid without category" do
      recipe2 = build(:recipe, category: nil)
      expect(recipe2).to_not be_valid
    end
  end
end
