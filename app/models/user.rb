class User < ActiveRecord::Base
  # mount_uploader :photo, PhotoUploader
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bibs, dependent: :destroy
  has_many :races, through: :bibs
  has_many :orders
  # validates :first_name, :last_name, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
