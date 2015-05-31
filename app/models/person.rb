class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :status
end
