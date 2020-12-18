class WalletSubsidyTransaction {
  String date;
  String amount;
  String title;
  String status;
  String walletId;
  String description;
  String walletTransactionId;
  String id;

  WalletSubsidyTransaction(
      {this.date,
      this.amount,
      this.title,
      this.status,
      this.walletId,
      this.description,
      this.walletTransactionId,
      this.id});

  factory WalletSubsidyTransaction.fromJson(Map<String, dynamic> json) {
    return WalletSubsidyTransaction(
        date: json["date"],
        amount: json["amount"].toString(),
        title: json["title"],
        status: json["status"],
        walletId: json["walletId"],
        description: json["description"],
        walletTransactionId: json["walletTransactionId"],
        id: json["id"]);
  }
}

// "date": "2020-03-12T16:04:31.02",
//     "amount": 500,
//     "title": "Fuel Purchase",
//     "status": "Debit",
//     "walletId": "7b91b5c8-a2e7-465b-860a-7cb1ecfe6db9",
//     "description": "Transction done at Fuel Metrics(Demo Branch), Hervert Macaulay Yaba, Lagos",
//     "walletTransactionId": "2620a3c4-f408-4042-974b-b1c2be8e81aa",
//     "id": "b170d4e1-4d89-4e1e-9db4-abcd4649a481"
