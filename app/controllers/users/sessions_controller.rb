# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    render json: {
      data: UserSerializer.new(resource),
      token: request.env['warden-jwt_auth.token']
    }, status: :ok
  end

  def respond_to_on_destroy
    head :no_content
  end
end