class Comment < ApplicationRecord
  belongs_to :commentable

  has_many :comments, as: :commentable
end
