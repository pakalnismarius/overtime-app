require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of post' do
      visit posts_path
      expect(page).to have_content(/Post/)
    end
  end

  describe 'creation' do
    before do 
      user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456", first_name: "Dzo", last_name: "Travianis")
      login_as(user, :scope => :user)
      visit new_post_path
    end

    it 'has a new for that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Something"
      click_on "Save"
      expect(page).to have_content("Something")
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end

  end

end 