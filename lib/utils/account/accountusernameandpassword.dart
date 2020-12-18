class AccountUsernamePassword {
  String username;
  String password;

  AccountUsernamePassword({this.username, this.password});

  factory AccountUsernamePassword.fromDB(Map<String, dynamic> res) =>
      AccountUsernamePassword(
          username: res["username"], password: res["password"]);
}
