class Users::ConfirmationsController < Devise::ConfirmationsController
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    redirect_to "#{ENV['FRONTEND_URL']}/sign-up" and return unless resource.errors.empty?

    redirect_to "#{ENV['FRONTEND_URL']}/sign-in?confirmed=true", allow_other_host: true
  end
end