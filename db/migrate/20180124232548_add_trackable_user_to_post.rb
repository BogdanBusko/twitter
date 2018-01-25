class AddTrackableUserToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :trackable_user, foreign_key: true
  end
end
