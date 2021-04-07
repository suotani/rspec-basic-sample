FactoryBot.define do
  factory :user do
    sequence(:email){|i| "name#{i}@example.com"}
    sequence(:password){|i| "password" }
    sequence(:password_confirmation){|i| "password" }
  end
end
