@user = User.create(first_name: "ma", last_name: "pa", email: "ma@pa.lt", password: "123456", password_confirmation: "123456")
puts "created one user"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "work is done"