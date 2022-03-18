
FactoryBot.define do
  factory :user do
    sequence(:first_name) { |n| "John (#{n})" }
    sequence(:last_name) { |n| "Smith (#{n})" }
    sequence(:date_of_birth) { 40.years.ago }
    email { nil }
    sequence(:password) { |n| "password(#{n})" }
  end
end