FactoryGirl.define do
  factory :location do
    latitude { Forgery(:geo).latitude }
    longitude { Forgery(:geo).longitude }

    person
  end
end
