require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "POST /posts" do
    @user = FactoryBot.create(:user)

    it "fails to create post without user signin" do
      post "/posts", params: {
        content: "my content",
        user: @user
      }

      expect(response).to have_http_status(:unauthorized)

      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body[:errors][0][:message]).to eq("You need to sign in or sign up before continuing.")
    end

    it "creates a post successfully after confirmed user signin" do
      @user = FactoryBot.create(:user)
      @user.confirm

      sign_in @user
      
      post "/posts", params: {
        content: "my content",
        user: @user
      }

      expect(response).to have_http_status(:success)

      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body[:data][:content]).to eq("my content")
      expect(body[:data][:user][:email]).to eq(@user.email)
      expect(body[:data][:user][:id]).to eq(@user.id)
      expect(body[:data][:user][:name]).to eq(@user.name)
    end
  end 
  
  describe "GET /posts" do
    it "retrieves all posts with successfully" do
      FactoryBot.create_list(:post, 3)

      get "/posts"
      expect(response).to have_http_status(:success)

      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body[:data].length).to be(3)
    end
  end 
end
