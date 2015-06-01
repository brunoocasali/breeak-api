FactoryGirl.define do
  factory :person do
    bio { Forgery(:lorem_ipsum).text }
    name { Forgery(:name).full_name }
    email { Forgery(:email).address }
    birthday_at { Forgery(:date).date }
    fb_access_token { Forgery(:basic).encrypt }

    location
    status
  end
end
