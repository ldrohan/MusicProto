require 'spec_helper'

describe "Users response" do

  describe "root path" do
    it "should pass" do
      get "/"
      response.status.should be(302)
    end
  end

  describe "Signup Users path" do
    it "should pass" do
      get "/users/sign_up"
      response.status.should be(200)
    end
  end

  describe "Signin Users path" do
    it "should pass" do
      get "/users/sign_up"
      response.status.should be(200)
    end
  end

end
