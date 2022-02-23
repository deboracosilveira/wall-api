require 'rails_helper'

RSpec.describe Users::ConfirmationsController, type: :controller do    
  it "checks user is confirmed with token received by email" do
    user = FactoryBot.create(:user)

    received_token = Devise.mailer.deliveries.last.body.match(/confirmation_token=(.+)">/x)[1]
    user = User.confirm_by_token(received_token)

    expect(user.reload.confirmed?).to be(true)
  end
end
