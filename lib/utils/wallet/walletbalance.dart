class WalletBalance {
  String balance;
  String referralCode;
  String subsidyBalance;
  String bvn;
  var reservedAccount;
  var dailyLimit;
  bool staging;

  WalletBalance(
      {this.balance,
      this.referralCode,
      this.subsidyBalance,
      this.bvn,
      this.reservedAccount,
      this.dailyLimit,
      this.staging});

  factory WalletBalance.fromJson(Map<String, dynamic> json) {
    return WalletBalance(
      balance: json["balance"].toString(),
      referralCode: json["referralCode"],
      subsidyBalance: json["subsidyBalance"].toString(),
      bvn: json["bvn"],
      reservedAccount: json["reservedAccount"],
      dailyLimit: json["dailyLimit"],
      staging: json["staging"],
    );
  }
}
