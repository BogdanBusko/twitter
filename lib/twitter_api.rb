class TwitterApi  
  def self.user(username_or_id)
    client.user(username_or_id)
  end

  def self.user_timeline(username_or_id)
    client.user_timeline(username_or_id)
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key    = "NvPZUaQt3ff068gnxuIk8Pvrh"
      config.consumer_secret = "3gIF2OVfCAYsKJxDh6ebfyPOikZfzhRjHfWuDfPl9sEExnhrIz"
    end
  end
end