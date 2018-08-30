class Order < ApplicationRecord
  has_one :user
  has_one :cart
  has_many :items, :through => :cart
end
