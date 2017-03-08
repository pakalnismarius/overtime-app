require 'rails_helper'

RSpec.describe User, type: :model do
      
  before do 
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can not be created without first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom name method" do
    it "has a method that combines first_name and last_name" do
      expect(@user.full_name).to eq("PA, MA")
    end
  end
end
