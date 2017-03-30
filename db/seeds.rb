@user = User.create(first_name: "ma",
                    last_name: "pa",
                    email: "ma@pa.lt",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "66802369")

puts "created one user"

AdminUser.create(first_name: "admin",
                  last_name: "name",
                  email: "admin@test.lt",
                  password: "123456",
                  password_confirmation: "123456",
                  phone: "66802369")
puts "Created admin user"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} Lorem Ipsum is simply dummy text of the printing and typesetting 
    industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
    took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
    but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
    with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing
    software like Aldus PageMaker including versions of Lorem Ipsum.", user_id: @user.id, overtime_request: 2.5)
end

puts "100 post created"

100.times do |audit_log|
  AuditLog.create(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs create"