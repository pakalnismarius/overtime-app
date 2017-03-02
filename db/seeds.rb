100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale content")
end

puts "work is done"