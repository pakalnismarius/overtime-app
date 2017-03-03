require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creattion" do

    before do
      @post = Post.create(date: Date.today, rationale: "Anyting")
    end

    # it "can be created" do 
    #   expect(@post).to be_valid
    # end

    it "Should not be created without date and rationale" do 
      post = Post.create()
      expect(post).to_not be_valid
    end
  end
end
