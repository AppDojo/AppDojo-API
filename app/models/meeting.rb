class Meeting < ActiveRecord::Base
  has_many :check_ins
  has_many :users, through: :check_ins

  validates :name, :start_time, presence: true
end
