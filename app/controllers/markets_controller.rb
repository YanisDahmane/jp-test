class MarketsController < ApplicationController
  before_action :set_market, only: [:show]
  def index
    @markets = Market.all
  end

  def show
    @items = @market.items
    @cart = current_cart
  end

  private

  def set_market
    @market = Market.find(params[:id])
  end
end
