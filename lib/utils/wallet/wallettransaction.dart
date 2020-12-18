class WalletTransaction {
  String date;
  String amount;
  String currentBalance;
  String source;
  String status;
  String walletId;
  var description;
  String uniqueId;
  String id;

  WalletTransaction(
      {this.date,
      this.amount,
      this.currentBalance,
      this.source,
      this.status,
      this.walletId,
      this.description,
      this.uniqueId,
      this.id});

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return WalletTransaction(
        date: json["date"],
        amount: json["amount"].toString(),
        currentBalance: json["currentBalance"].toString(),
        source: json["source"],
        status: json["status"],
        walletId: json["walletId"],
        description: json["description"],
        uniqueId: json["uniqueId"],
        id: json["id"]);
  }
}

// "date": "2020-03-17T15:40:27.29",
//     "amount": 200,
//     "currentBalance": 12139.63,
//     "source": "Remis",
//     "status": "Debit",
//     "walletId": "7c1bb8d9-bf19-4621-a6b1-703441bdb6a1",
//     "description": null,
//     "uniqueId": "09473592",
//     "id": "446d435b-8fa0-4eb5-ac92-1ce123bc2a87"
