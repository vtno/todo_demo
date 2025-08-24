# === Variables & Types ===
name  = 'Alice'   # String
count = 3         # Integer
pi    = 3.14      # Float
bool  = true      # TrueClass

puts name.class   # => String
puts count.class  # => Integer
puts pi.class     # => Float
puts bool.class   # => TrueClass
puts nil.class    # => NilClass
puts false.class  # => FalseClass

# === String Interpolation ===
puts "Hello #{name}, you have #{count} messages."

# === Symbols (lightweight identifiers) ===
status = :done
puts status       # => done
puts status.class # => Symbol

# === Conditionals ===
if count > 0
  puts 'You have messages!'
elsif count == 0
  puts 'Empty inbox'
else
  puts 'Negative?'
end

score = 90
case score
when 90..100
  puts 'Grade A'
when 80..89
  puts 'Grade B'
when 70..79
  puts 'Grade C'
else
  puts 'Needs improvement.'
end

# === Arrays ===
nums = [1, 2, 3, 4]
puts nums[0]      # => 1
puts nums.first
nums << 5         # append
puts nums.inspect # => [1, 2, 3, 4, 5]

# === Hashes (like dict/map) ===
person = { name: 'Alice', age: 30 }
puts person[:name]   # => Alice
puts person[:age]    # => 30

# === Iteration & Blocks ===
# nums.forEach((n) => {n*2})
nums.each do |n|
  puts n * 2
end

doubled = nums.map { |n| n * 2 }
puts doubled.inspect # => [2, 4, 6, 8, 10]

# === Methods ===
def greet(who = 'world')
  "Hello #{who}"
end

puts greet           # => "Hello world"
puts greet('Bob')    # => "Hello Bob"

# === Everything is an Object ===
puts 42 # => "42"
puts 'hi'.upcase # => "HI"

# === Classes ===
class Dog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def bark
    "#{@name} says woof!"
  end
end

fido = Dog.new('Fido')
puts fido.bark # => "Fido says woof!"
