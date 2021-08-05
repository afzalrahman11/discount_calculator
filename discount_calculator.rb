puts "Enter the items purchased seperated by a comma : "
str = gets.chomp
a =[]
a = str.split(",")
count = Hash.new(0)
bill = Hash.new
amount = {"milk" => 3.97, "bread" => 2.17, "banana" => 0.99, "apple" =>0.89}
dis_amount = {"milk" => 5, "bread" => 6}

a.each do |item|
  count[item] += 1
end

if count["milk"] >= 2
  extra = count["milk"] - 2
  bill["milk"] = dis_amount["milk"] + (extra * amount["milk"])
  saved_on_milk = (count["milk"]*amount["milk"]) - bill["milk"]
else
  bill["milk"] = count["milk"] * amount["milk"]
end
#creating the bill amount for milk including the discount amount(if any).

if count["bread"] >= 3
  extra = count["bread"] - 3
  bill["bread"] = dis_amount["bread"] + (extra * amount["bread"])
  saved_on_bread = (count["bread"]*amount["bread"]) - bill["bread"]
else
  bill["bread"] = count["bread"] * amount["bread"]
end
#creating the bill amount for bread including the discount amount(if any).

bill["banana"] = count["banana"] * amount["banana"]
#creating the bill amount for banana.

bill["apple"] = count["apple"] * amount["apple"]
#creating the bill amount for apple.

amount = bill["milk"] + bill["bread"] + bill["banana"] + bill["apple"]
#calculating the total amount

amount_saved = saved_on_milk + saved_on_bread

  puts "Items\t Quantity\t Amount"
  puts "-" * 50
#printing the titles

a.uniq.each do |item| 

  if count[item] >0
    puts "#{item}\t #{count[item]}\t\t $#{bill[item].round(2)}"
  end

end

puts "Total amount : $#{amount}"
puts "Amount saved: $#{amount_saved.round(2)}"