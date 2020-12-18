import 'package:mobx/mobx.dart';
import 'package:remis/utils/account/accountlogin.dart';
import 'package:remis/database/Database.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

part 'accountloggedinstore.g.dart';

class AccountLoggedInStore = _AccountLoggedInStore with _$AccountLoggedInStore;

abstract class _AccountLoggedInStore with Store {
  @observable
  String name = " Daniel ";

  @action
  void changeNamed() {
    name = name + "1";
  }

  @observable
  AccountLogin user = AccountLogin();

//  @observable
//  ObservableFuture<List<AccountLogin>> accountLoginFuture;

  @action
  Future<String> setUserData({String username, String password}) async {
    dynamic result = await HttpRequestModel.loginUser(username, password);
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
      AccountLogin newUser = result["object"];
      await DBProvider.db.setUpUser(newUser);
//      accountLoginFuture = ObservableFuture((DBProvider.db.getUser()));
//      final List<AccountLogin> userData = await accountLoginFuture;
      final List<AccountLogin> userData = await DBProvider.db.getUser();
      user = AccountLogin(
          firstName: userData[0].firstName,
          lastName: userData[0].lastName,
          token: userData[0].token,
          email: userData[0].email,
          phoneNumber: userData[0].phoneNumber);
      return NetworkCallsMessages.successful;
    }
  }
}
