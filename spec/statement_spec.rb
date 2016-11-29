require 'statement'

describe Statement do

  subject(:statement) {described_class.new }

  let(:first_statement) { double :first_statement, :bank_statement => [{date: "10/01/2012", credit: 1000.00, debit: nil, balance: 1000.00}] }


  it 'responds to show statement' do
    expect(statement).to respond_to(:print_statement)
  end

  it 'hold the users bank statment' do
    expect(first_statement.bank_statement).to eq [{date: "10/01/2012", credit: 1000.00, debit: nil, balance: 1000.00}]
  end

  it 'prints the bank statement to the STDOUT' do
    statement.bank_statement = [{date: "10/01/2012", credit: 1000.0, debit: nil, balance: 1000.0}]
    expect{ statement.print_statement }.to output("date || credit || debit || balance\n10/01/2012 || 1000.0 ||  || 1000.0\n").to_stdout
  end

  context "#new_deposit" do

    it 'should add a record of a new deposit to the bank statement' do
      statement.new_deposit("10/01/2012", 1000, 1000)
      expect(statement.bank_statement).to eq ([{date: "10/01/2012", credit: "1000.00", debit: nil, balance: "1000.00"}])
    end

  end

  context "#new_withdrawal" do

    before do
      statement.new_deposit("10/01/2012", 1000, 1000)
    end

    it 'should add a record of a new withdrawal to the bank statement' do
      statement.new_withdrawal("13/01/2012", 500, 500)
      expect(statement.bank_statement).to eq ([{date: "13/01/2012", credit: nil, debit: "500.00", balance: "500.00"}, {date: "10/01/2012", credit: "1000.00", debit: nil, balance: "1000.00"}])
    end

  end



end
