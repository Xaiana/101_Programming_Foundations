arr = ['10', '11', '9', '7', '8']
p arr.sort {|a, b| b.to_i <=> a.to_i}

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

=begin
to order the array by published date in ascending order
first iterate through the array and access the hash element at the published key
translate published key value into integer
sort the values
return array
=end

books.sort_by! do |book|
  book[:published]
end

p books

=begin
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

#reference 'g' for each object
arr1.map do |n|
  if n.size > 1
    n.map do |sub_arr|
      if sub_arr.size > 1
        sub_arr.map do |i|
          if i == 'g'
            p i
          end
        end
      end
    end
  end
end

p arr1[2][1][3]
p arr2[1][:third][0]
p arr3[2][:third][0][0]
p hsh1["b"][1]
p hsh2[:third].key(0)
p hsh2[:third].keys[0]

=end

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] = 4
arr2[2] = 4
hsh1[:first][2][0] = 4
hsh2[['a']][:a][2] = 4

p arr1
p arr2
p hsh1
p hsh2

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

herman = munsters["Herman"]["age"]
grandpa = munsters["Grandpa"]["age"]
eddie = munsters["Eddie"]["age"]
total_age = herman + grandpa + eddie
p "The total age of all males in the munsters family is #{total_age}"

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

p total_male_age


munsters.each_pair do |member, details|
puts "#{member} is #{details["age"]} years old and #{details["gender"]}"
end

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = "aeiou"
hsh.values.each do |value|
  value.each do |string|
     string.chars.each do |char|
      p char if vowels.include?(char)
    end
  end
end
