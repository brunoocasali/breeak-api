class Person < ActiveRecord::Base
  has_one :location
  has_one :status
end
