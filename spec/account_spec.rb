require 'account'

describe Account do

  subject(:account) {described_class.new}

  let(:statement1) {double :statement1, bank_statement: [{date: "18/01/2012", credit: 500.00, debit: nil, balance: 1500.00},{date: "10/01/2012", credit: 1000.00, debit: nil, balance: 1000.00}] }

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
      expect(account.statement.bank_statement[0][:credit]).to eq "1000.00"
    end

    it "should change the balance of the account" do
      expect{account.deposit("10/01/2012", 1000.00)}.to change{account.balance}.by(1000)
    end
  end

  context '#withdraw' do

    before do
      account.deposit("18/01/2012", 1000)
      account.deposit("19/01/2012", 500)
    end

    it "can withdraw money" do
      account.withdraw("21/01/2012", 250.00)
      expect(account.balance). to eq 1250.00
    end

  end



end
