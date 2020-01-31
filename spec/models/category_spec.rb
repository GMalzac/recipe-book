require 'rails_helper'

RSpec.describe Category, type: :model do

  before(:example) do
    @category1 = build(:category)
  end

  describe "Associations" do
    it 'has_many recipes' do
      assc = described_class.reflect_on_association(:recipes)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(@category1).to be_valid
    end

    it 'is not valid without a name' do
      category2 = build(:category, name: nil)
      expect(category2). to_not be_valid
    end

    it "has a unique name" do
      create(:category)
      category2 = build(:category, name: "Desserts")
      expect(category2).to_not be_valid
    end
  end
end
