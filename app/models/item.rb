class Item < ApplicationRecord

  validates :unit_id, :presence => true
  validates :size, :numericality => { :greater_than => 0 }
  validates :size, :presence => true
  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :category_id, :uniqueness => { :scope => [:unit_id, :size, :name, :brand], :message => "Item already exists" }
  validates :brand, :presence => true

  belongs_to :category

  belongs_to :unit

  has_many :price_entries, :dependent => :destroy

  has_many :shopping_list_adds, :class_name => "ShoppingListItem", :dependent => :destroy

  has_many :sellers, :through => :price_entries, :source => :store

  has_many :purchasers, :through => :shopping_list_adds, :source => :user

end
