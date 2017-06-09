class Category < ApplicationRecord

  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_many :items, :dependent => :destroy

  has_many :price_entries, :through => :items, :source => :price_entries

  has_many :shopping_list_adds, :through => :items, :source => :shopping_list_adds

end
