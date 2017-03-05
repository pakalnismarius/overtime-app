require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do

    before do
      user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Dzo", last_name: "Travianis")
      @post = Post.create(date: Date.today, rationale: "Some content", user_id: user.id)
    end

    it "can be created" do 
      expect(@post).to be_valid
    end

    it "Should not be created without date and rationale" do 
      post = Post.create()
      expect(post).to_not be_valid
    end
  end
end
