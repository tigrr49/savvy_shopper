class ShoppingListItem < ApplicationRecord

  validates :user_id, :presence => true
  validates :user_id, :uniqueness => { :scope => [:item_id], :message => "Item already added previously to shopping list" }
  validates :quantity, :numericality => { :greater_than => 0 }
  validates :quantity, :presence => true
  validates :item_id, :presence => true

  belongs_to :user

  belongs_to :item

end
