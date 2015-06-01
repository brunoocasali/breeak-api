FactoryGirl.define do
  factory :status do
    last_logged_at { Forgery(:date).date }
  end
end
