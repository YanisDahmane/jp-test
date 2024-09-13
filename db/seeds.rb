puts "Cleaning database..."
Market.destroy_all

puts "Creating markets..."
Market.create!(name: "Chez Yanis")

puts "Created #{Market.count} markets."
puts "Creating items for market"

Market.all.each do |market|
  Item.create!(
    name: "Apple",
    code: "AP1",
    price: 5,
    market: market
  )
  Item.create!(
    name: "Fruit Tea",
    code: "FR1",
    price: 3.11,
    market: market
  )
  Item.create!(
    name: "Coffee",
    code: "CF1",
    price: 11.23,
    market: market
  )
  puts "Created items for market #{market.name}"
end