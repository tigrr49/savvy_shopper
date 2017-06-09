class ShoppingListItem < ApplicationRecord

  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => [:price_entry_id], :message => "Item already added previously to shopping list" }
  validates :quantity, :numericality => { :greater_than => 0 }
  validates :quantity, :presence => true
  validates :price_entry_id, :presence => true

  belongs_to :user

  belongs_to :item

  belongs_to :price_entry

  has_one :category, :through => :item, :source => :category

  has_one :store, :through => :price_entry, :source => :store

end
