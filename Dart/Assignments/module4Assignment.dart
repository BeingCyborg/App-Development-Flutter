abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited: \$$amount');
    print('Current balance: \$$balance');
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    balance -= amount;
    balance += balance * interestRate;
    print('Withdrawn: \$$amount');
    print('Current balance with interest: \$$balance');
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
      print('Withdrawn: \$$amount');
      print('Current balance: \$$balance');
    } else {
      print('Insufficient funds.');
    }
  }
}

void main() {
  print('----------------------');
  print('');
  var savingsAccount = SavingsAccount(201062, 1000.0, 0.05);
  savingsAccount.deposit(500.0);
  savingsAccount.withdraw(600.0);
  print('');

  print('----------------------');
  print('----------------------');
  print('');
  var currentAccount = CurrentAccount(201065, 2000.0, 1000.0);
  currentAccount.deposit(800.0);
  currentAccount.withdraw(600.0);
  print('----------------------');
  print('');
}
