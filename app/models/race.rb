class Race < ActiveRecord::Base
  has_many :bibs, dependent: :destroy
  validates :date, :address, :name, presence: true
  validates :name, uniqueness: true
  CATEGORIES = %w(marathon cross night_race team_race classic_race)
end
