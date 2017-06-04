class Store < ApplicationRecord

  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :price_entries, :dependent => :destroy

  has_many :items, :through => :price_entries, :source => :item

end
