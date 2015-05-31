class PersonSerializer < ActiveModel::Serializer
  attributes :id, :bio, :birthday_at, :email, :name, :fb_access_token
  has_one :location
  has_one :status
end
