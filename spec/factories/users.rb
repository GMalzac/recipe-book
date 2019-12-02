FactoryBot.define do
  factory :user do
    username { "Bob" }
    email { "bob@gmail.com" }
    password { "blahblah" }
    password_confirmation { password }

    factory :random_user do
      username { Faker::Name.unique.name }
      email { Faker::Internet.unique.email }
    end
  end
end
