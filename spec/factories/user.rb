FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "leo#{n}@cloud.com" }
    password "password"
    password_confirmation "password"
    first_name "Leo"
    last_name "Correa"
  end
end