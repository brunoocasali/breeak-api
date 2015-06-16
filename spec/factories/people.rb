FactoryGirl.define do
  factory :person do
    bio { Forgery(:lorem_ipsum).text }
    name { Forgery(:name).full_name }
    user_id { rand(999999999999) }
    email { Forgery(:email).address }
    phone { Forgery(:address).phone }
    birthday_at { Forgery(:date).date }
    fb_access_token { Forgery(:basic).encrypt }
    tags %w(games sports ti)

    location
    status
  end

  factory :invalid_person, parent: :person do
    bio nil
    name nil
    user_id nil
    phone nil
    email nil
    birthday_at nil
    fb_access_token nil
    tags nil

    location nil
    status nil
  end
end
