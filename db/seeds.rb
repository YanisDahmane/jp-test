puts "Cleaning database..."
Market.destroy_all

puts "Creating markets..."
Market.create!(name: "Chez Yanis")
Market.create!(name: "Chez Momo")

puts "Created #{Market.count} markets."
puts "Creating items for market"

Market.all.each do |market|
  10.times do |i|
    Item.create!(
      name: "#{Faker::Food.fruits}_#{market.id}_#{i}",
      code: "#{market.name}_#{i}",
      price: rand(1.0..10.0),
      market: market
    )
  end
  puts "Created 10 items for market #{market.name}"
end