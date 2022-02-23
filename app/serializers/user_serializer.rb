class UserSerializer < ActiveModel::Serializer
  attributes :created_at,
             :email,
             :id,
             :name
end
