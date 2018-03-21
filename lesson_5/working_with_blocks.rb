maps = [[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

p maps
=begin
the block on line 2 puts the result of the first method which is the element at index 0
in each array element of the original array and returns nil
arr.first returns an integer for each arr element 1 and 3
the map method will return [1, 3]
=end

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

p my_arr
=begin
method each do is called on outer array
calling each on sub-array arr puts a num in arr if num is greater than 5 and returns nil
18, 7 ad 12 are put
each returns the object it was called on which is the original array
no transformation
assigning this block to a variable returns just the numbers returned from the inner block
=end

[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

=begin
map method called on the outter array line 32 and returns a sub-array
map methid is called on the sub-array represented by arr and returns an element of arr represented by num
inner block is called on the element of arr at current iteration and returns an integer
transformation occurs and the return value of the original map method will be [[2, 2], [6, 8]]
=end

[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

=begin
select method is called on the array on line 45 this returns a key value pair representedby hash
all method of block is called on the hash object and returns key and value
line 47 value is a string so we check its value at index 0 and compare it to the key which has been transformed to a string
inner block returns a hash where all keys match the value at index 0
select will return an array of these hashes
=end

[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
=begin
map on line 59 is called on triple layered array
it returns an element which will be one array of integers and one of strings represented by element1
the block on line 60 is called on the sub-array element1 and returns an array of arrays represented by element2 at each current iteration
inner block at line 61 is called on the single layer of arrays and returns an element represented by element3 at each iteration which will be either a string or integer
line 62 is called on the element of the array and returns if it is greater than 0
=end

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

=begin
map is called on outer array and returns an array
arr.map is called on sub-array and returns an array of integers or and array of arrays
if an integer array is returned than we perform inner block on line 76 where el represents the element of each sub-array
if an array is returned we call map to iterate over each array represents by el  [1,2] and [3,4]
now we are inside the array and can access the elements represented by n
the inner block on line 80 is performed on each integer and returns a new array
the 2nd map method call will return an array of integers and an array of arrays transformed by the blocks
the first map call will return nested arrays in the same structure transformed by te blocks
original object is not changed
=end
