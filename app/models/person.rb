class Person < ActiveRecord::Base
  has_one :location
  has_one :status

  validates :name, presence: true
end
