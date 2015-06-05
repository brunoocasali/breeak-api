FactoryGirl.define do
  factory :location do
    latitude { Forgery(:geo).latitude.round(6) }
    longitude { Forgery(:geo).longitude.round(6) }
  end

  factory :invalid_location, parent: :location do
    latitude nil
    longitude nil
  end
end
