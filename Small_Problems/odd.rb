# input is one integer/ output will be boolean
# return true if odd else false
# is odd if % 2 != 0

def is_odd?(num)
  if num % 2 != 0
    puts true
  else
    puts false
  end
end

puts is_odd?(2)
puts is_odd?(-20)
puts is_odd?(3)
puts is_odd?(41)

def is_odd_remainder?(num)
  if num.remainder(2) != 0
    puts true
  else
    puts false
  end
end

puts is_odd_remainder?(-21)
puts is_odd_remainder?(2)
puts is_odd_remainder?(-3)
puts is_odd_remainder?(25)
