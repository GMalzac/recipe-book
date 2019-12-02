FactoryBot.define do
  factory :category do
    name { "Desserts" }

    factory :random_category do
      name { Faker::Food.unique.dish }
    end
  end
end
