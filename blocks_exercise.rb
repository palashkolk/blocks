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
