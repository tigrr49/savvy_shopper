class Item < ApplicationRecord

  validates :unit_id, :presence => true
  validates :size, :numericality => { :greater_than => 0 }
  validates :size, :format => { :with => /\A\d{1,4}(\.\d{0,2})?\z/, :message => "should have no more than 2 decimal places and must be less than 9,999.99" }
  validates :size, :presence => true
  validates :name, :presence => true
  validates :category_id, :presence => true
  validates :category_id, :uniqueness => { :scope => [:unit_id, :size, :name, :brand], :message => "^This item already exists" }
  validates :brand, :presence => true

  belongs_to :category, optional: true

  belongs_to :unit, optional: true

  has_many :price_entries, :dependent => :destroy

  has_many :shopping_list_adds, :class_name => "ShoppingListItem", :dependent => :destroy

  has_many :sellers, :through => :price_entries, :source => :store

  has_many :purchasers, :through => :shopping_list_adds, :source => :user

end
