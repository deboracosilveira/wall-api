require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.build(:user)
  end
  
  describe "Validations" do
    it "should be valid" do
      expect(@user).to be_valid
    end

    it "should not be valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "should not be valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "name should be less than 32 characters" do
      @user.name = "this is a very very very long name"
      expect(@user).to_not be_valid
    end

    it "should not be valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "password must have at least 6 characters" do
      @user.password = '12'
      expect(@user).to_not be_valid
    end
  end
end
