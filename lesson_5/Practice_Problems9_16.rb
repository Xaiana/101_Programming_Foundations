arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |array|
  array.sort!{|a, b| b <=> a}
end
p arr

new_hahs = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  incremented_hash = {}
  hash.each do |key, integer|
    incremented_hash[key] = integer +1
  end
  incremented_hash
end

p new_hahs

arr1 = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr1.map do |sub_arr|
  sub_arr.select {|num| num % 3 == 0}
end

arr2 = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = {}
arr2.each do |element|
  hsh[element[0]] = element[1]
end
p hsh

arr3 = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr3.sort_by! do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
p arr3

hsh1 = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh1.map do |k, v|
  if v[:type] == 'fruit'
    v[:colors].map do |color|
      color.capitalize
    end
  elsif v[:type] == 'vegetable'
    v[:size].upcase
  end
end

arr4 = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr4.select do |hash|
  hash.all? do |k, v|
    v.all? do |num|
      num.even?
    end
  end
end

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID
