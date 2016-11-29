class Statement

  attr_accessor :bank_statement

  def initialize
    @bank_statement = [{date: nil, credit: nil, debit: nil, balance: 0.00}]
  end

  def print_statement
    @bank_statement.each do |x|
      puts "#{x[:date]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}"
    end
  end

  def new_deposit(date, amount, new_balance)
    @bank_statement.unshift({date: date, credit: nil, debit: amount, balance: new_balance})
  end


end
