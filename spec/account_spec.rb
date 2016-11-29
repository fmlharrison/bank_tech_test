require 'account'

describe Account do

  subject(:account) {described_class.new}

  let(:statement2) {double :statement2}
  subject(:account2) {described_class.new(statement2)}


  context '#initialize' do

    it 'initializes with bank statement' do
      expect(account.statement).to be_an_instance_of(Statement)
    end

    it 'has a starting balance of £0.00' do
      expect(account.balance).to eq Account::STARTING_BALANCE
    end

  end

  context '#deposit' do

    it "should be about to deposit money into the account" do
      expect(statement2).to receive(:new_deposit)
      account2.deposit("10/01/2012", 1000.00)
    end

    it "should change the balance of the account" do
      expect{account.deposit("10/01/2012", 1000.00)}.to change{account.balance}.by(1000)
    end
  end

  context '#withdraw' do

    it "can withdraw money" do
      expect(statement2).to receive(:new_withdrawal)
      account2.withdraw("21/01/2012", 250.00)
    end

    it 'reduces the balance in the account' do
      account.deposit("10/01/2012", 1000.00)
      expect{account.withdraw("11/01/2012", 500.00)}.to change{account.balance}.by(-500)
    end

  end

  context '#show_statment' do

    it "can print the statement" do
      expect(statement2).to receive(:print_statement)
      account2.show_statment
    end

  end



end
