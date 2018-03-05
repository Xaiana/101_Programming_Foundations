flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = {}
flintstones.each_with_index do |name, i|
  flintstones_hash[name] = i
end

puts flintstones_hash
p flintstones

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
total_ages = 0
ages.each { |_,age| total_ages += age }
puts total_ages

ages.reject {|key, value| value > 100}
ages
ages.keep_if { |_, age| age < 100}
ages
ages.values.min
ages.values

puts flintstones.index { |name| name[0, 2] == "Be" }

puts flintstones.map {|name| name[0,3]}

statement = "The Flintstones Rock"

hash = {}
chars = ('A' .. 'Z').to_a + ('a'..'z').to_a
chars.each do |char|
  char_frequency = statement.scan(char).count
  hash[char] = char_frequency if char_frequency > 0
end
puts hash

words = "the flintstones rock"

words_array = words.split

words_array.each do |word|
  word.capitalize!
end

puts words_array.join(" ")

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0..18
    details["age_group"] = "kid"
  when 18..65
    detai|s["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
