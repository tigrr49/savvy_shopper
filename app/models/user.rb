class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :last_name, :presence => true
  validates :first_name, :presence => true

  has_many :shopping_list_items, :dependent => :destroy

  has_many :items_to_buy, :through => :shopping_list_items, :source => :item

end
