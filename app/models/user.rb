class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me

  before_save :ensure_authentication_token

  validates :email, uniqueness: true
  validates :email, :first_name, :last_name, presence: true

  has_many :check_ins
  has_many :meetings, through: :check_ins
end
