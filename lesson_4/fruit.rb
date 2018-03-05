produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

=begin
select the fruit in the produce hash
turn keys into an array
first select the keys
return only if key's value is 'Fruit'
append to selected_fruit array
return array
exit if counter is greater than produce array
=end

def select_fruit(hash)
  counter = 0
  selected_fruit = {}
  fruits = hash.keys

  loop do
    break if counter == fruits.size
    current_element = fruits[counter]
    element_value = hash[current_element]
    if element_value == 'Fruit'
      selected_fruit[current_element] = element_value
    end
    counter += 1
  end
  selected_fruit
end

puts select_fruit(produce)
