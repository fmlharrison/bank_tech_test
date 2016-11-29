#Tech Test 2 - Command Line Bank Programme

##Specification

###Requirements

You should be able to interact with the your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

###Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012 And a deposit of 2000 on 13-01-2012 And a withdrawal of 500 on 14-01-2012 When she prints her bank statement Then she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

###How to use

Clone this repo and navigate to the project directory, then use the command line to run the programme:
```
$ irb
:001 > require './lib/account.rb'
:002 > account = Account.new
```
Then interact with the programme using the following methods:  

`deposit(date, amount)` - The deposit method takes 2 parameters, date(as a string in dd/mm/yyyy format) and amount as an integer.  

`withdraw(date, amount)` - The withdraw method takes 2 parameters, date(as a string in dd/mm/yyyy format) and amount as an integer.

`show_statment` - This methods shows the current accounts bank statement in the command line.

###How to test

Once cloned, you can test by running:
```
$ rspec
```
