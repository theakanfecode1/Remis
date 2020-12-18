class WalletFunding {
  String publicKey;
  String encryptionKey;
  var corpId;
  String referralCode;
  bool cardSaved;
  String cardDetails;

  WalletFunding(
      {this.publicKey,
      this.encryptionKey,
      this.corpId,
      this.referralCode,
      this.cardSaved,
      this.cardDetails});

  factory WalletFunding.fromJson(Map<String, dynamic> json) {
    return WalletFunding(
        publicKey: json["publicKey"],
        encryptionKey: json["encryptionKey"],
        corpId: json["corpId"],
        cardSaved: json["cardSaved"],
        cardDetails: json["cardDetails"]);
  }
}

// "publicKey": "FLWPUBK-36fbfdc445fddc136025acc3d39a1ac3-X",
//   "encryptionKey": "2fce594afa9cb7e2f190fc74",
//   "corpId": null,
//   "referralCode": "2WC2",
//   "cardSaved": false,
//   "cardDetails": ""
