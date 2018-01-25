class TrackableUser < ApplicationRecord
  has_many :posts, dependent: :delete_all

  has_and_belongs_to_many :user

  scope :get_user, -> username_or_id { 
    where("id = ? || screen_name like ?", "#{username_or_id}", "%#{username_or_id}%")
  }

  def self.search(search)
    if search.present?
      where("id = ? || screen_name = ?", "#{search}", "#{search}")
    else
      all
    end
  end

  # def self.update_all_data
  #   UpdateTwitterData.update
  # end
end
