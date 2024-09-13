class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  def add_item(item)
    cart_item = cart_items.find_by(item: item)
    if cart_item
      cart_item.quantity += 1
      cart_item.save
    else
      cart_items.create(cart: self, item: item, quantity: 1)
    end
  end
end
