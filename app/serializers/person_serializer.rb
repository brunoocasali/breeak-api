class PersonSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bio, :birthday_at, :fb_access_token, :tags,
             :location, :status

  def location
    LocationSerializer.new(object.location, scope: scope, root: false)
  end

  def status
    StatusSerializer.new(object.status, scope: scope, root: false)
  end
end
