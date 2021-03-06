require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "asdf", user_id: user.id, daily_hours: 3.5)
  end

  before do
    login_as(user, :scope => :user)
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
      post
      second_post = FactoryGirl.create(:second_post)
      second_post.update!(user_id: user.id)

      visit posts_path

      expect(page).to have_text(post.rationale)
      expect(page).to have_text(second_post.rationale)
    end

    it 'has a scope that only post creator can see their posts' do
      other_user = User.create(first_name: 'NOn',
                                last_name: 'ni',
                                email: 'testas@testas.com',
                                password: 'asdfasdf',
                                password_confirmation: "asdfasdf",
                                phone: "3706")
      post_from_other_user = Post.create(date: Date.today,
                                          rationale: "This post shouldnt be seen",
                                          user_id: other_user.id, daily_hours: 3.5)
      visit posts_path
      expect(page).to_not have_content(/This post shouldnt be seen/)
    end
  end

  describe 'new' do
    # it 'has a link from homepage' do
    #   visit root_path
    #   click_link("new_post_from_nav")
    #   expect(page.status_code).to eq(200)
    # end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)

      delete_user = FactoryGirl.create(:user)
      login_as(delete_user, :scope => :user)
      post_to_delete = Post.create(date: Date.today, rationale: 'asdf', user_id: delete_user.id, daily_hours: 3.5)
      visit posts_path
      click_link("delete_post_#{post_to_delete.id}_from_index")
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
      fill_in 'post[daily_hours]', with: 12.5
      expect { click_on "Save" }.to change(Post, :count).by(1)
      
    end

    it 'will have a user associated it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      fill_in 'post[daily_hours]', with: 7.5
      click_on "Save"
      expect(User.last.posts.last.rationale).to eq("User Association")
    end

    describe 'edit' do
      it 'can be edidted' do
        visit edit_post_path(post)
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "Something edidted"
        click_on "Save"
        expect(page).to have_content("Something edidted")
      end

      it 'cannot be edidted by non authorized user' do
        logout(:user)
        non_authorized_user = FactoryGirl.create(:non_authorized_user)
        login_as(non_authorized_user, :scope => :user)

        visit edit_post_path(post)
        expect(current_path).to eq(root_path)

      end

    end

  end

end 