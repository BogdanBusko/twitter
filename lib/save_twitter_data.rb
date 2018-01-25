class SaveTwitterData < TwitterApi
  def self.save_user(username_or_id, current_user_id)
    twitter_user = user(username_or_id)
    user_tweets = user_timeline(username_or_id)
    user = User.find(current_user_id)

    trackable_user = user.trackable_user.create!(
      id: twitter_user.id,
      name: twitter_user.name,
      screen_name: twitter_user.screen_name
    )

    save_post(trackable_user, user_tweets)
  end

  def self.save_post(trackable_user, user_tweets)
    user_tweets.each do |tweet|
      post = trackable_user.posts.create!(
        id: tweet.id,
        text: tweet.text,
        likes: tweet.favorite_count,
        created_at: tweet.created_at
      ) if !tweet.quoted_tweet?
    end
  end
end