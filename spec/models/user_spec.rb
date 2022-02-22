require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "john@doe.com",
                        name: 'John',
                        password: "john_password",
    )
  }

  describe "Validations" do
    it "should be valid" do
      expect(subject).to be_valid
    end

    it "should not be valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "should not be valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "name should be less than 32 characters" do
      subject.name = "this is a very very very long name"
      expect(subject).to_not be_valid
    end

    it "should not be valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "password must be at least 6 characters" do
      subject.password = '12'
      expect(subject).to_not be_valid
    end
  end
end
