class StatusSerializer < ActiveModel::Serializer
  attributes :id, :last_logged_at
  has_one :person
end
