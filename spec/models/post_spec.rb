require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do

    before do
      user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
    end

    it "can be created" do
      @post.date = nil
      @post.rationale = nil
      @post.daily_hours = nil
      expect(@post).to_not be_valid
    end

    it "Should not be created without date and rationale" do 
      post = Post.create()
      expect(post).to_not be_valid
    end

    it 'has an daily hours greater than 0.0' do
      @post.daily_hours = 0.0
      expect(@post).to_not be_valid 
    end
  end
end
