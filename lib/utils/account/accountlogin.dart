class AccountLogin {
  String email;
  String firstName;
  String lastName;
  String token;
  String phoneNumber;

  AccountLogin({
    this.email,
    this.firstName,
    this.lastName,
    this.token,
    this.phoneNumber,
  });
  factory AccountLogin.fromJson(Map<String, dynamic> json) => AccountLogin(
        email: json["email"],
        firstName: json["firstName"],
        phoneNumber: json["phone"],
        lastName: json["lastName"],
        token: json["token"],
      );
  factory AccountLogin.fromDB(Map<String, dynamic> json) => AccountLogin(
        email: json["email"],
        firstName: json["firstname"],
        phoneNumber: json["phonenumber"],
        lastName: json["lastname"],
        token: json["token"],
      );
}
