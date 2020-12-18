// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  final _$setUserDataAsyncAction = AsyncAction('_SignUpStore.setUserData');

  @override
  Future<String> setUserData(
      {String username,
      String password,
      String firstName,
      String lastName,
      String referralCode,
      String phone}) {
    return _$setUserDataAsyncAction.run(() => super.setUserData(
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
        referralCode: referralCode,
        phone: phone));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
