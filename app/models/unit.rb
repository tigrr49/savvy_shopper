class Unit < ApplicationRecord

  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :items, :dependent => :destroy

  has_many :price_entries, :through => :items, :source => :price_entries

end
