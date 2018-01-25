class PostsController < ApplicationController
  def index
    @posts = Post.where(trackable_user_id: User.find(current_user.id).trackable_user_ids).order(created_at: :desc)
  end
end
