// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountloggedinstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountLoggedInStore on _AccountLoggedInStore, Store {
  final _$nameAtom = Atom(name: '_AccountLoggedInStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$userAtom = Atom(name: '_AccountLoggedInStore.user');

  @override
  AccountLogin get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(AccountLogin value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$setUserDataAsyncAction =
      AsyncAction('_AccountLoggedInStore.setUserData');

  @override
  Future<String> setUserData({String username, String password}) {
    return _$setUserDataAsyncAction
        .run(() => super.setUserData(username: username, password: password));
  }

  final _$_AccountLoggedInStoreActionController =
      ActionController(name: '_AccountLoggedInStore');

  @override
  void changeNamed() {
    final _$actionInfo = _$_AccountLoggedInStoreActionController.startAction(
        name: '_AccountLoggedInStore.changeNamed');
    try {
      return super.changeNamed();
    } finally {
      _$_AccountLoggedInStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
user: ${user}
    ''';
  }
}
