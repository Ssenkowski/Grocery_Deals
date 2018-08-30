class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts
  has_many :orders
  belongs_to :current_cart, :class_name => "Cart"

  def checkout
    current_user.current_cart = nil
  end

  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id
    save
    new_cart
  end

  def remove_cart
    self.current_cart_id = nil
    save
  end
end
