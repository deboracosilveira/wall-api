require 'rails_helper'

RSpec.describe @post, type: :model do
  before(:each) do
    @post = FactoryBot.create(:post)
  end

  describe "Validations" do
    it "should be valid" do
      expect(@post).to be_valid
    end

    it "should not be valid without an user" do
      @post.user_id = nil
      expect(@post).to_not be_valid
    end

    it "should not be valid without a content" do
      @post.content = nil
      expect(@post).to_not be_valid
    end

    it "content should not be am empty string" do
      @post.content = "  "
      expect(@post).to_not be_valid
    end

    it "content must be less than 300 characters" do
      @post.content = "x" * 301
      expect(@post).to_not be_valid
    end
  end
end
