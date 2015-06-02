FactoryGirl.define do
  factory :status do
    last_logged_at { Forgery(:date).date }
  end

  factory :invalid_status, parent: :status do
    last_logged_at nil
  end
end
