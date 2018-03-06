=begin
input a string and integer > 0
print string n times
=end

puts "Please enter a word or sentence"
string = gets.chomp
puts "and now a number"
number = gets.chomp

counter = 0
loop do
  puts "#{string}\n"
  counter += 1
  break if counter == number.to_i
end

def repeat(string, number)
  number.times do
    puts string
  end
end

repeat('Hello', 9)
