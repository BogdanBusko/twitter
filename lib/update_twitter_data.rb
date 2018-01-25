class UpdateTwitterData < TwitterApi
  def self.update
    TrackableUser.all.each do |trackable_user|
      user_timeline(trackable_user.id).each do |tweet|
        unless trackable_user.posts.exists?(id: tweet.id)
          trackable_user.posts.create!(
            id: tweet.id,
            text: tweet.text,
            created_at: tweet.created_at
          )
        end
      end
    end
  end
end