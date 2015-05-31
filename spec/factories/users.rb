FactoryGirl.define do
  factory :user do
    name { Forgery(:name).full_name }
    email { Forgery(:email).address }
    phone { Forgery(:address).phone }
    password { Forgery(:basic).password(at_least: 8) }

    role
  end
end
