require 'account'

describe Account do

  subject(:account) {described_class.new}

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
      account.deposit("10/01/2012", 1000.00)
      expect(account.statement.bank_statement[0][:debit]).to eq 1000.00
    end

    it "should change the balance of the account" do
      expect{account.deposit("10/01/2012", 1000.00)}.to change{account.balance}.by(1000)
    end
  end



end
