class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting

  validates :user_id, :meeting_id, presence: true
end
