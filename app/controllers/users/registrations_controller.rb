# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        data: UserSerializer.new(resource).serializable_hash,
        token: request.env['warden-jwt_auth.token']
      }, status: :ok
    else
      render json: {
        errors: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end
