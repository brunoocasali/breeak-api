class PersonSerializer < ActiveModel::Serializer
  attributes :id, :bio, :birthday_at, :email, :tags, :name, :fb_access_token,
             :location, :status

  def location
    LocationSerializer.new(object.location, scope: scope, root: false)
  end

  def status
    StatusSerializer.new(object.status, scope: scope, root: false)
  end
end
