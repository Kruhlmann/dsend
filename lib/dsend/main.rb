require "discordrb"

module DSend
  def send_message(options, messages)
    if not options.api_key or not options.chan_id then
      puts "Missing arguments"
      exit
    end
    puts "Creating a bot using key #{options.api_key}"
    bot = Discordrb::Bot.new  token: options.api_key
    puts "Establishing battlefield control, stand by"
    bot.ready do
      puts "Connection established"
      puts "Attempting to send #{messages.length} message(s)"
      messages.each do |m|
        puts "Sending message #{m} to channel #{options.chan_id}"
        bot.send_message(options.chan_id, m)
      end
      bot.stop
    end
    bot.run
  end
end
