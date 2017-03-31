namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
    puts "I'm in a rake task!"
  end

  desc "Sends mal notifications for managers"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
      ManagerMailer.email(admin).deliver_later
    end
  end

end
