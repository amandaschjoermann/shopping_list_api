# Clean seed data
ShoppingList.destroy_all

puts "Creating shopping list"

shopping_list = ShoppingList.create!(name: "My awesome shopping list")

puts "Adding items to the shopping list"

%w(Tomato Bread Toothpaste).each do |name|
  ShoppingListItem.create!(name: name, shopping_list: shopping_list)
  puts "✅"
end

ShoppingListItem.create!(name: "Egg salad", done: true, shopping_list: shopping_list)
puts "✅"

puts "Done!"
