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
      click_link("new_post_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'has a link from homepage' do
      @post = FactoryGirl.create(:post)
      visit posts_path
      click_link("delete_post_#{@post.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do 
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

    describe 'edit' do

      before do
        @edit_user = User.create(first_name: "asdf", last_name: "fdsa", email: "asdf@asdd.com", password: "123456", password_confirmation: "123456")
        login_as(@edit_user, :scope => :user)
        @edit_post = Post.create(date:Date.today, rationale: "asdf", user_id: @edit_user.id)
      end

      it 'can be edidted' do
        visit edit_post_path(@edit_post)
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Something edidted"
        click_on "Save"
        expect(page).to have_content("Something edidted")
      end

      it 'cannot be edidted by non authorized user' do
        logout(:user)
        non_authorized_user = FactoryGirl.create(:non_authorized_user)
        login_as(non_authorized_user, :scope => :user)

        visit edit_post_path(@edit_post)
        expect(current_path).to eq(root_path)

      end

    end

  end

end 