def double_vision
  yield
  yield
end

# double_vision { puts 'How many fingers I am holding up?' }

@transactions = [10, -15, 25, 30, -24, -70, 999]

# def transaction_statement(&block)
#   @transactions.each(&block)
# end

# transaction_statement do |transaction|
#   p '%0.2f' % transaction # The bank that calls the method can define how it is handled.
# end
# OUtput for this section is not same as shown the tutorial

def transaction_statement
  formatted_transactions = []
  @transactions.each do |transaction|
    formatted_transactions << yield(transaction)
  end

  p formatted_transactions
end

transaction_statement do |transaction|
  '%0.2f' % transaction
end

def mad_limbs
  yield 'cool', 'beans', 'burrito'
  yield 'hot', 'tomato', 'burrito'
  puts 'Also, I said,'
  yield 'very hot', 'banana', 'burrito'
end

mad_limbs { |adj, noun| puts "I said #{adj} #{noun}!" }

def awesome_method
  hash = { a: 'apple', b: 'banana', c: 'cookie' }
  hash.each do |key, value| # rubocop:disable Style/ExplicitBlockArgument
    yield key, value
  end
end

awesome_method { |key, value| puts "#{key}: #{value}" }
# awesome_method    #gives jumperror when called without argument

def maybe_block
  puts 'block party' if block_given?
  puts 'executed anyway'
end

maybe_block
maybe_block {}

my_lambda = -> { puts 'my lambda' }
my_other_lambda = -> { puts 'hello from the other side' }
my_lambda.call
my_other_lambda.call
my_name = ->(name) { puts "hello, #{name} here" }
my_age = lambda { |age| puts "I am #{age} years old" } # rubocop:disable Style/Lambda
my_name.call('Sabir')
my_age.call('39')

# ############Proc########
a_proc = proc { |name, age| puts "name: #{name}----- age: #{age}" }
a_proc.call('Sabir', 39)
a_proc.call(39)
# Procs does not care about numner of arguments passed whereas
# lambda will raise error if number of arguments passed does not
# match the number of arguments declared with.
a_lambda = -> { return 1 } # rubocop:disable Style/RedundantReturn
puts a_lambda.call

def my_method
  a_proc = proc { return }
  puts 'this line will be printed'
  a_proc.call # line returns from the embracing method
  puts 'this line is never reached'
end

my_method
