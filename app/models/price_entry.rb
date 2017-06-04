class PriceEntry < ApplicationRecord

  validates :store_id, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
  validates :price, :presence => true
  validates :item_id, :presence => true

  belongs_to :store

  belongs_to :item

end
