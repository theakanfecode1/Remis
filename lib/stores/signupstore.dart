import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

part 'signupstore.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @action
  Future<String> setUserData(
      {String username,
      String password,
      String firstName,
      String lastName,
      String referralCode,
      String phone}) async {
    dynamic result = await HttpRequestModel.registerUser(
        username, password, firstName, lastName, referralCode, phone);
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
