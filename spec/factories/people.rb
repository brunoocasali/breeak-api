FactoryGirl.define do
  factory :person do
    bio { Forgery(:lorem_ipsum).text }
    name { Forgery(:name).full_name }
    email { Forgery(:email).address }
    birthday_at { Forgery(:date).date }
    fb_access_token { Forgery(:basic).encrypt }
    tags %w(games sports ti)

    location
    status
  end

  factory :invalid_person, parent: :person do
    bio nil
    name nil
    email nil
    birthday_at nil
    fb_access_token nil
    tags nil

    location nil
    status nil
  end
end
