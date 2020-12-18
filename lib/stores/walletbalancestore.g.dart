// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walletbalancestore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletBalanceStore on _WalletBalanceStore, Store {
  final _$walletBalanceAtom = Atom(name: '_WalletBalanceStore.walletBalance');

  @override
  WalletBalance get walletBalance {
    _$walletBalanceAtom.reportRead();
    return super.walletBalance;
  }

  @override
  set walletBalance(WalletBalance value) {
    _$walletBalanceAtom.reportWrite(value, super.walletBalance, () {
      super.walletBalance = value;
    });
  }

  final _$getBalanceAsyncAction = AsyncAction('_WalletBalanceStore.getBalance');

  @override
  Future<String> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  @override
  String toString() {
    return '''
walletBalance: ${walletBalance}
    ''';
  }
}
