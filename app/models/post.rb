class Post < ApplicationRecord
  has_many :comments, as: :commentable,  dependent: :delete_all

  belongs_to :trackable_user
end
