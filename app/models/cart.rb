class Cart < ApplicationRecord
  attr_accessor :items
  def initialize(*args)
    super
    @items = {}
  end

  def add_item(item)
    id = item.id.to_s
    if @items[id]
      @items[id][:quantity] += 1
    else
      @items[id] = { item: item, quantity: 1 }
    end
  end

  def remove_item(item)
    id = item.id.to_s
    if @items[id]
      if @items[id][:quantity] > 1
        @items[id][:quantity] -= 1
      else
        @items.delete(id)
      end
    end
  end
end
