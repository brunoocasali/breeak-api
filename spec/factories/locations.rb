FactoryGirl.define do
  factory :location do
    latitude { Forgery(:geo).latitude }
    longitude { Forgery(:geo).longitude }
  end

  factory :invalid_location, parent: :location do
    latitude nil
    longitude nil
  end
end
