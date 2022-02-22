class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    render status: :unprocessable_entity and return unless resource.errors.empty?

    redirect_to "https://www.google.com/", allow_other_host: true
  end
end