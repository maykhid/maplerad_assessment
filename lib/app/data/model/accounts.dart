final accountData = Accounts.fromJson(Accounts.data);

class Account {
  final String flag;
  final String amount;
  final String currency;

  Account({
    required this.flag,
    required this.amount,
    required this.currency,
  });

  // Factory constructor to create an instance from a JSON object
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      flag: json['flag'],
      amount: json['amount'],
      currency: json['currency'],
    );
  }

  // Method to convert an instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'flag': flag,
      'amount': amount,
      'currency': currency,
    };
  }
}

class Accounts {
  Accounts({
    required this.accounts,
  });

  final List<Account> accounts;

  factory Accounts.fromJson(List<Map<String, dynamic>> json) {
    return Accounts(accounts: json.map((e) => Account.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    return {'accounts': accounts};
  }

  static const data = [
    {
      "flag": "assets/images/us.png",
      "amount": "\$200.00",
      "currency": "USD",
    },
    {
      "flag": "assets/images/gh.png",
      "amount": "₵5000.00",
      "currency": "GHS",
    },
    {
      "flag": "assets/images/ng.png",
      "amount": "₦15,000,000.00",
      "currency": "NGN",
    },
  ];
}
