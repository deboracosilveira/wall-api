require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  describe "after registration" do
    it "user is not confirmed" do
      user = FactoryBot.create :user
      expect(user.confirmed?).to_not be true
    end

    it "sends welcome/confirmation email" do
      user = FactoryBot.build :user

      expect { user.save }.to change(Devise.mailer.deliveries, :count).by(1)
    end
  
    describe "check that email" do
      before(:each) do
        @user = FactoryBot.create(:user)
      end

      it "was sent to correct email" do
        confirmation_email = Devise.mailer.deliveries.last
        expect(@user.email).to eq confirmation_email.to[0]
      end

      it "contains welcome message" do
        confirmation_email = Devise.mailer.deliveries.last
        expect(confirmation_email.body.to_s).to have_content 'Welcome'
      end
    end
  end
end
