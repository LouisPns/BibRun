class Race < ActiveRecord::Base
  has_many :bibs, dependent: :destroy
  validates :date, :address, :name, presence: true
  validates :name, uniqueness: true

end
