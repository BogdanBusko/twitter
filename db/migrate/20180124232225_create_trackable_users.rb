class CreateTrackableUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :trackable_users do |t|
      t.string :name
      t.string :screen_name

      t.timestamps
    end
  end
end
