FactoryBot.define do
  factory :recipe do
    title {"Breaded fish"}
    ingredients {"A fish, breadcrumbs, eggs, and flour"}
    description {"Prepare the breading: Prep the breadcrumbs, eggs, and flour. Bread the fish. Bake in the oven"}
    author {"Mr Cook"}
    user { create(:random_user) }
    category { create(:random_category) }
  end
end

