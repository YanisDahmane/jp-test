class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]
  before_action :set_item, only: [:create]

  def create
    @cart_items = current_cart.cart_items.preload(:item)
    @cart_item = @cart_items.find_by(item: @item)
    if @cart_item
      @cart_item.quantity += 1
      @cart_item.save
    else
      CartItem.create(cart: current_cart, item: @item, quantity: 1)
    end

    # Load turbo frame
    render turbo_stream: turbo_stream.replace("order_summary", partial: "carts/order_summary", locals: { cart_items: @cart_items })
  end

  def destroy
    if @cart_item
      @cart_item.quantity -= 1
      @cart_item.save
      @cart_item.destroy if @cart_item.quantity.zero?
    end

    # Load turbo frame
    @cart_items = current_cart.cart_items.preload(:item)
    render turbo_stream: turbo_stream.replace("order_summary", partial: "carts/order_summary", locals: { cart_items: @cart_items })
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
