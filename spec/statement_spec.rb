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
    expect{ statement.print_statement }.to output("10/01/2012 || 1000.0 ||  || 1000.0\n").to_stdout
  end



end
