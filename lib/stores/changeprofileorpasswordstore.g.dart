// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changeprofileorpasswordstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangeProfileOrPasswordStore on _ChangeProfileOrPasswordStore, Store {
  final _$changePasswordAsyncAction =
      AsyncAction('_ChangeProfileOrPasswordStore.changePassword');

  @override
  Future<String> changePassword(
      {String oldPassword, String newPassword, String confirmPassword}) {
    return _$changePasswordAsyncAction.run(() => super.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword));
  }

  final _$changeProfileAsyncAction =
      AsyncAction('_ChangeProfileOrPasswordStore.changeProfile');

  @override
  Future<String> changeProfile(
      {String firstName, String lastName, String phoneNumber}) {
    return _$changeProfileAsyncAction.run(() => super.changeProfile(
        firstName: firstName, lastName: lastName, phoneNumber: phoneNumber));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
