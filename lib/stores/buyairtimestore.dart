import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

part 'buyairtimestore.g.dart';

class BuyAirtimeStore =_BuyAirtimeStore with _$BuyAirtimeStore;

abstract class _BuyAirtimeStore with Store {
  @action
  Future<String> buyAirtime({String phoneNumber, String amount}) async {
    dynamic result = await HttpRequestModel.buyAirtime(phoneNumber, amount);
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
      return NetworkCallsMessages.successful;
    }
  }
}
