class Status < ActiveRecord::Base
  validates :last_logged_at, presence: true
end
