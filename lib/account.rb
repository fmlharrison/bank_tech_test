require 'statement'

class Account

  STARTING_BALANCE = 0.00

  attr_reader :statement, :balance

  def initialize
    @statement = Statement.new
    @balance = STARTING_BALANCE
  end

  def deposit(date, amount)
    increase_balance(amount)
    @statement.new_deposit(date, amount, @balance)
  end

  private

  def increase_balance(amount)
    @balance += amount
  end

end
