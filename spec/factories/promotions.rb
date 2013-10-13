# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :promotion do
    title "MyString"
    description "MyString"
    price 1
    expiration "2013-10-13"
    website "MyString"
  end
end
