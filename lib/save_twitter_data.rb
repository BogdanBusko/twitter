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

      save_comment(post, user_tweets) if post.present?
    end
  end

  def self.save_comment(post, user_tweets)
    user_tweets.each do |tweet|
      if tweet.quoted_tweet? && tweet.quoted_tweet.id == post.id
        comments = post.comments.create!(
          id: tweet.id,
          body: tweet.text,
          username: tweet.user.screen_name,
          created_at: tweet.created_at
        )
        save_comment(comments, user_tweets)
      end
    end
  end
end