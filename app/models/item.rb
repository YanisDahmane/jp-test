class Item < ApplicationRecord
  belongs_to :market
  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
