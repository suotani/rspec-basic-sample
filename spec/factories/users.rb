FactoryBot.define do
  factory :user do
    sequence(:email){|i| "name#{i}@example.com"}
    password { "password" }
    password_confirmation { "password" }
    trait :valid do # ファクトリーの継承
    end
  end
  
end
