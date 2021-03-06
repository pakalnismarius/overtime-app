@employee = Employee.create(first_name: "ma",
                    last_name: "pa",
                    email: "ma@pa.lt",
                    password: "123456",
                    password_confirmation: "123456",
                    phone: "66802369",
                    ssn: 1234,
                    company: "ABC company")

puts "created one employee"

AdminUser.create(first_name: "admin",
                  last_name: "name",
                  email: "admin@test.lt",
                  password: "123456",
                  password_confirmation: "123456",
                  phone: "66802369",
                  ssn: 1234,
                  company: "ABC company")

puts "Created admin user"

AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 2.weeks))
AuditLog.create(user_id: @employee.id, status: 0, start_date: (Date.today - 20.days))


puts "3 audit logs create"

100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} Lorem Ipsum is simply dummy text of the printing and typesetting 
    industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
    took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
    but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s
    with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing
    software like Aldus PageMaker including versions of Lorem Ipsum.", user_id: @employee.id, daily_hours: 12.5)
end

puts "100 post created"

