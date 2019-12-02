require 'rails_helper'

RSpec.describe Recipe, :type => :model do

  before(:example) do
    @recipe1 = create(:recipe)
  end

  it "is valid with valid attributes" do
    p @recipe1
    expect(@recipe1).to be_valid
  end

  it "is not valid without title" do
    recipe2 = build(:recipe, title: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end

  it "is not valid without ingredients" do
    recipe2 = build(:recipe, ingredients: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end

  it "is not valid without description" do
    recipe2 = build(:recipe, description: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end

  it "is not valid without author" do
    recipe2 = build(:recipe, author: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end

  it "is not valid without user" do
    recipe2 = build(:recipe, user: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end

  it "is not valid without category" do
    recipe2 = build(:recipe, category: nil)
    p recipe2
    expect(recipe2).to_not be_valid
  end
end
