require_relative 'statement'

class Account

  STARTING_BALANCE = 0.00

  attr_reader :statement, :balance

  def initialize(statement=Statement.new)
    @statement = statement
    @balance = STARTING_BALANCE
  end

  def deposit(date, amount)
    increase_balance(amount)
    @statement.new_deposit(date, amount, @balance)
  end

  def withdraw(date, amount)
    decrease_balance(amount)
    @statement.new_withdrawal(date, amount, @balance)
  end

  def show_statment
    @statement.print_statement
  end

  private

  def increase_balance(amount)
    @balance += amount
  end

  def decrease_balance(amount)
    @balance -= amount
  end

end
