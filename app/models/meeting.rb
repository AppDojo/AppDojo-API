class Meeting < ActiveRecord::Base
  has_many :check_ins
  has_many :users, through: :check_ins
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  validates :name, :start_time, presence: true
end
