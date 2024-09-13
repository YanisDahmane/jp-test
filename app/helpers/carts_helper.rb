module CartsHelper
  def promotion(cart_items)
    @promotion = {}
    apples = cart_items.select { |cart_item| cart_item.item.name == "Apple" }.first
    if apples && apples.quantity >= 3
      @promotion["Réduction 50ctm / pommes (3 pommes min)"] = -0.5 * apples.quantity
    end
    @promotion
  end
end
