class Race < ActiveRecord::Base
  has_many :bibs, dependent: :destroy
  validates :date, :address, :name, presence: true
  validates :name, uniqueness: true
  CATEGORIES = %w(marathon cross night_race team_race classic_race)

  mount_uploader :picture, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def min_price
    if !!self.bibs.first
      "From #{self.bibs(price: :desc).first.price}€"
    else
      "Add your bib"
    end
  end

end

# if !!self.bibs.first
#   "#{self.bibs(price: :desc).first.price}€"
# else
#   "Add your bib"
# end
