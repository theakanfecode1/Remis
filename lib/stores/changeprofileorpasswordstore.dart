import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

part 'changeprofileorpasswordstore.g.dart';

class ChangeProfileOrPasswordStore = _ChangeProfileOrPasswordStore with _$ChangeProfileOrPasswordStore;

abstract class _ChangeProfileOrPasswordStore with Store{
  @action
  Future<String> changePassword({String oldPassword,String newPassword,String confirmPassword}) async {
     dynamic result = await HttpRequestModel.changePassword(oldPassword, newPassword, confirmPassword);
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

  @action
  Future<String> changeProfile({String firstName,String lastName,String phoneNumber}) async {
    dynamic result = await HttpRequestModel.updateProfile(firstName, lastName, phoneNumber);
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