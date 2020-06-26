require "discordrb"

module DSend
  def send_message(options, messages)
    if not options[:api_key] or not options[:chan_id] then
      puts "Missing arguments"
      exit
    end
    bot = Discordrb::Bot.new  token: options.api_key
    bot.run
    puts "Connection established"
    puts "Attempting to send #{messages.length} messages"
    messages.each do |m|
      puts "Sending message #{m} to channel #{options[:chan_id]}"
      bot.send_message(options[:chan_id], m)
    end
    bot.stop
  end
end
