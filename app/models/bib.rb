class Bib < ActiveRecord::Base
  belongs_to :race
  belongs_to :user
  belongs_to :order

  validates :price, :quantity, presence: true


end
