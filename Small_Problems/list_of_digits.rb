# input is any positive integar/ output is list of digits in integer
# must be  positive to work

def list_digits(num)
  if num.is_a?(Integer) && num > 0
    num.to_s.chars.map {|i| i.to_i}
  else
    return false
  end
end

p list_digits(123232)
p list_digits(2)
p list_digits('yay!')
p list_digits(-1)
p list_digits(2.2)
p list_digits(0.3)
