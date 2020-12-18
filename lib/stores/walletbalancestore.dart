import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/utils/wallet/walletfunding.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';
import 'package:remis/utils/wallet/walletbalance.dart';

part 'walletbalancestore.g.dart';

class WalletBalanceStore = _WalletBalanceStore with _$WalletBalanceStore;

abstract class _WalletBalanceStore with Store {
  @observable
  WalletBalance walletBalance = WalletBalance(balance: "0.00");
  @observable
  WalletFunding walletFunding = WalletFunding();

  @action
  Future<String> getBalance() async {
    dynamic result = await HttpRequestModel.getWalletBalance();
    if (result["object"] == null) {
      if (result["statusCode"] == 401) {
        return NetworkCallsMessages.unauthorized;
      } else if (result["statusCode"] == 400) {
        return NetworkCallsMessages.badRequest;
      } else if (result["statusCode"] == 600) {
        return NetworkCallsMessages.socketError;
      } else if (result["statusCode"] == 500) {
        return NetworkCallsMessages.serverError;
      } else {
        return NetworkCallsMessages.unknownError;
      }
    } else {
      walletBalance = result["object"];
      return NetworkCallsMessages.successful;
    }
  }

  @action
  Future<String> getWalletFundProperties() async {
    dynamic result = await HttpRequestModel.walletFunding();
    if (result["object"] == null) {
      if (result["statusCode"] == 401) {
        return NetworkCallsMessages.unauthorized;
      } else if (result["statusCode"] == 400) {
        return NetworkCallsMessages.badRequest;
      } else if (result["statusCode"] == 600) {
        return NetworkCallsMessages.socketError;
      } else if (result["statusCode"] == 500) {
        return NetworkCallsMessages.serverError;
      } else {
        return NetworkCallsMessages.unknownError;
      }
    } else {
      walletFunding = result["object"];
      return NetworkCallsMessages.successful;
    }
  }
}
