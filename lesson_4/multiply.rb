def multiply(numbers, x)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= x

    counter += 1
  end
  numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts multiply(my_numbers, 3)
puts my_numbers
