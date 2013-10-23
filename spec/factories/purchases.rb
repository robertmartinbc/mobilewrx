# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    purchase_id 1
    user_id 1
    stripe_reference_id "MyString"
  end
end
