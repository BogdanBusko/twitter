class CreateJoinTableTrackableUserUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trackable_users, :users do |t|
      # t.index [:trackable_user_id, :user_id]
      # t.index [:user_id, :trackable_user_id]
    end
  end
end
