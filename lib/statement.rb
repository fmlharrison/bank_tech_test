class Statement

  attr_reader :bank_statement

  def initialize
    @bank_statement = []
  end

  def print_statement
    print_headings
    @bank_statement.each do |x|
      puts "#{spacing(x[:date])}#{spacing(x[:credit])}#{spacing(x[:debit])}#{spacing(x[:balance])}"
    end
  end

  def new_deposit(date, amount, new_balance)
    @bank_statement.unshift({date: date, credit: '%.2f' % amount, debit: " " , balance: '%.2f' % new_balance})
  end

  def new_withdrawal(date, amount, new_balance)
    @bank_statement.unshift({date: date, credit: " ", debit: '%.2f' % amount, balance: '%.2f' % new_balance})
  end

  private

  def print_headings
    headings = @bank_statement[0].keys
    headings.each do |x|
      space = 10 - (x.length)
      print " " + x.to_s + (" "*space) + "||"
    end
    puts
  end

  def spacing(string)
    print " " + string + (" "*(10-string.length)) + "||"
  end


end
