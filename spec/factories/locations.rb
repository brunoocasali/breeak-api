FactoryGirl.define do
  factory :locations do
    latitude { Forgery(:geo).latitude }
    longitude { Forgery(:geo).longitude }

    person
  end
end
