require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do 
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of post' do
      expect(page).to have_content(/Post/)
    end

    it 'has a list of posts' do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
  end

  describe 'new' do
    it 'has a link from homepage' do
      visit root_path

    end
  end

  describe 'creation' do
    before do 
      visit new_post_path
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
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

    describe 'edit' do

      before do
        @post = FactoryGirl.create(:post)
      end

      it 'can be reached by clicking edit on index page' do
        visit posts_path
        click_link("edit_#{@post.id}")
        expect(page.status_code).to eq(200)
      end

      it 'can be edidted' do
        visit edit_post_path(@post)
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Something edidted"
        click_on "Save"
        expect(page).to have_content("Something edidted")
      end

    end

  end

end 