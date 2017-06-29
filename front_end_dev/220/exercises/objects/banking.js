function makeAccount(number){
  var balance = 0 ;
  var transactions = [];
  return {
    accountNumber: function(){
      return number;
    },
    transactions: function(){
      return transactions;
    },
    balance: function(){
      return balance;
    },
    deposit: function(amount) {
      this.recordTransaction('deposit',amount);
      balance += amount;
      return amount;
    },
    withdraw: function(amount) {
      if (amount > balance){
        amount = balance;
      }
      this.recordTransaction('withdrawal',amount);
      balance -= amount;
      return amount;
    },
    recordTransaction: function(type,amount){
      transactions.push({type: type, amount: amount});
    },
  };
}

function makeBank() {
  var accounts = [];
  return {
    openAccount: function(){
      var accountNumber = accounts.length + 101;
      var newAccount = makeAccount(accountNumber);
      accounts.push(newAccount);
      return newAccount;
    },
    transfer: function(source, destination,amount){
      return destination.deposit(source.withdraw(amount));
    },
  };
}

function print(text) {
  console.log(text);
}

var bank = makeBank();
var source = bank.openAccount();
source.deposit(100);
var destination = bank.openAccount();
bank.transfer(source, destination, 30);
print(source.balance());
print(destination.balance());
print(source.transactions());
print(source.accountNumber());




// print(bank.accounts);
// var account = makeAccount();
// var otherAccount = makeAccount();
// print(otherAccount.balance);
// console.log(account.balance);
// account.deposit(42);
// console.log(account.balance);
// print(account.withdraw(19));
// console.log(account.balance);
// console.log(account.withdraw(119));
// console.log(account.balance);
// print(account.transactions);

// var bank = makeBank();
// var acc1 = bank.openAccount();
// print(acc1.accountNumber);
// print(bank.accounts);
// print(bank.accounts[0]);
// var acc2 = bank.openAccount();
// print(acc2.accountNumber);
// print(bank.accounts);

