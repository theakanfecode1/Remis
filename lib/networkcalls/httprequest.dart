import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:remis/utils/account/accountlogin.dart';
import 'package:remis/utils/branch/branchNearby.dart';
import 'package:remis/utils/wallet/walletbalance.dart';
import 'package:remis/utils/wallet/walletfunding.dart';
import 'package:remis/utils/wallet/walletsubsidytransaction.dart';
import 'package:remis/utils/wallet/wallettransaction.dart';


class HttpRequestModel {
  static const baseRemisUrl = "https://api.epump.com.ng/";
  static const baseWalletUrl = baseRemisUrl + "Wallet/";
  static const baseAccountUrl = baseRemisUrl + "Account/";
  static const baseBranchUrl = baseRemisUrl + "Branch/";
  static const baseOrderUrl = baseRemisUrl + "Order/";
  static const baseBillPaymentUrl = baseRemisUrl + "Bill_Payment/";


  static String token = "";
  static Encoding encoding = Encoding.getByName('utf-8');

  static var loginAndSignUpHeader = {
    'Content-Type': 'application/json',
  };
  static var header = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer " + token
  };

//  "https://api.epump.com.ng/Account/login",

  static Future<dynamic> getWalletBalance() async {
    try {
      http.Response response =
      await http.get(baseWalletUrl + "Balance", headers: header);
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        Map body = jsonDecode(response.body);
        WalletBalance balance = WalletBalance.fromJson(body);
        return {"statusCode": 200, "object": balance};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> getAccountTransaction(String startDate,
      endDate) async {
    try {
      final http.Response response = await http.get(
          baseWalletUrl +
              "Transactions?startDate=" +
              startDate +
              "&endDate=" +
              endDate,
          headers: header);
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        List<dynamic> body = jsonDecode(response.body);
        List<WalletTransaction> transaction =
        body.map((e) => WalletTransaction.fromJson(e)).toList();
        return {"statusCode": 200, "object": transaction};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> getHomeTransaction() async {
    try {
      final http.Response response =
      await http.get(baseWalletUrl + "Transactions", headers: header);
      print(response);
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        List<dynamic> body = jsonDecode(response.body);
        List<WalletTransaction> transaction =
        body.map((e) => WalletTransaction.fromJson(e)).toList();
        return {"statusCode": 200, "object": transaction};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> loginUser(String username, String password) async {
    try {
      final http.Response response = await http.post(baseAccountUrl + "login",
          headers: loginAndSignUpHeader,
          encoding: encoding,
          body: jsonEncode(
              <String, String>{"userName": username, "password": password}));
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        Map body = jsonDecode(response.body);
        AccountLogin user = AccountLogin.fromJson(body);
        token = user.token;
        return {"statusCode": 200, "object": user};
      }
    } on Exception {
//      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> registerUser(String username,
      String password,
      String firstName,
      String lastName,
      String referralCode,
      String phone) async {
    try {
      final http.Response response =
      await http.post(baseAccountUrl + "Register",
          headers: loginAndSignUpHeader,
          encoding: encoding,
          body: jsonEncode(<String, String>{
            "userName": username,
            "password": password,
            "confirmPassWord": password,
            "phone": phone,
            "firstName": firstName,
            "lastName": lastName,
            "referralCode": referralCode,
            "otp": "",
            "reference": ""
          }));
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        return {"statusCode": 200, "object": "SucessfulSignUp"};
      }
    } on Exception {
//      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> changePassword(String oldPassword, String newPassword,
      String confirmPassword) async {
    try {
      http.Response response =
      await http.post(baseAccountUrl + "ChangePassword",
          headers: header,
          body: jsonEncode(<String, String>{
            "oldPassword": oldPassword,
            "newPassword": newPassword,
            "confirmPassword": confirmPassword,
          }));
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        return {"statusCode": 200, "object": "SucessfulPasswordChange"};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> walletFunding() async {
    try {
      http.Response response =
      await http.get(baseWalletUrl + "FundProperties?remis=true",
        headers: header,
      );
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        Map body = jsonDecode(response.body);
        WalletFunding walletFunding = WalletFunding.fromJson(body);
        return {"statusCode": 200, "object": walletFunding};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> updateProfile(String firstName, String lastName,
      String phoneNumber) async {
    try {
      http.Response response = await http.post(baseAccountUrl + "Update",
          headers: header,
          body: jsonEncode(<String, String>{
            "firstName": firstName,
            "lastName": lastName,
            "phoneNumber": phoneNumber,
          }));
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        return {"statusCode": 200, "object": "SucessfulProfileChange"};
      }
    } on Exception {
//      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }
  static Future<dynamic> buyAirtime(String phoneNumber, String amount) async {
    try {
      http.Response response = await http.post(baseBillPaymentUrl + "BuyAirtime",
          headers: header,
          body: jsonEncode(<String, String>{
            "phoneNumber": phoneNumber,
            "amount": amount
          }));
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        return {"statusCode": 200, "object": "SucessfulBuyAirtime"};
      }
    }
    on Exception {
//      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }


  }

  static Future<dynamic> getSubsidyTransaction() async {
    try {
      final http.Response response = await http
          .get(baseWalletUrl + "SubsidyTransactions", headers: header);
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        List<dynamic> body = jsonDecode(response.body);
        List<WalletSubsidyTransaction> transaction =
        body.map((e) => WalletSubsidyTransaction.fromJson(e)).toList();
        return {"statusCode": 200, "object": transaction};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }
  static Future<dynamic> getMyOrders() async {
    try {
      final http.Response response = await http
          .get(baseOrderUrl + "MyOrders", headers: header);
      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        List<dynamic> body = jsonDecode(response.body);
        return {"statusCode": 200, "object": "SuccessfulOrderGet"};
      }
    } on Exception {
      //      lets assume socketException will throw 600
      return {"statusCode": 600, "object": null};
    }
  }

  static Future<dynamic> getNearbyBranches(String latitude,
      String longitude) async {
    try {
      http.Response response = await http.get(
          baseBranchUrl + "GetNearby?latitude=" + latitude + "&longitude=" +
              longitude, headers: header);

      dynamic responseCode = _checkResponseStatusCode(response);
      if (responseCode["statusCode"] != 200) {
        return responseCode;
      } else {
        List<dynamic> body = jsonDecode(response.body);
        List<BranchNearby> stations =
        body.map((e) => BranchNearby.fromJson(e)).toList();
        return {"statusCode": 200, "object": stations};
      }
    }on Exception{
      return {"statusCode": 600, "object": null};

    }
  }

  static dynamic _checkResponseStatusCode(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return {
          "statusCode": 200,
        };
      case 401:
        return {"statusCode": 401, "object": null};
      case 400:
        return {"statusCode": 400, "object": null};
      case 500:
        return {"statusCode": 500, "object": null};
      default:
        return {"statusCode": 600, "object": null};
    }
  }
}




