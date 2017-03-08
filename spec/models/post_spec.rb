require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do

    before do
      user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
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
