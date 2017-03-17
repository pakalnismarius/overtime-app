module SmsTool
  def self.send_sms(number:, message:)
    puts "Sending sms..."
    puts "#{number} to #{message}"
  end
end