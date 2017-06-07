class PriceEntry < ApplicationRecord

  validates :store_id, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
  validates :price, :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/, :message => "should have no more than 2 decimal places and must be less than 9,999.99" }
  validates :price, :presence => true
  validates :item_id, :presence => true

  belongs_to :store

  belongs_to :item

  has_one :category, :through => :item, :source => :category

  has_one :unit, :through => :item, :source => :unit

end
