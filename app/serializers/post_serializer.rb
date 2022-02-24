# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :content,
             :created_at,
             :user

  def user
    UserSerializer.new(object.user)
  end
end
