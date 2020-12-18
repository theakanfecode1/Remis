// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallettransactionstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletTransactionStore on _WalletTransactionStore, Store {
  final _$homeWalletTransactionsAtom =
      Atom(name: '_WalletTransactionStore.homeWalletTransactions');

  @override
  List<WalletTransaction> get homeWalletTransactions {
    _$homeWalletTransactionsAtom.reportRead();
    return super.homeWalletTransactions;
  }

  @override
  set homeWalletTransactions(List<WalletTransaction> value) {
    _$homeWalletTransactionsAtom
        .reportWrite(value, super.homeWalletTransactions, () {
      super.homeWalletTransactions = value;
    });
  }

  final _$accountWalletTransactionsAtom =
      Atom(name: '_WalletTransactionStore.accountWalletTransactions');

  @override
  List<WalletTransaction> get accountWalletTransactions {
    _$accountWalletTransactionsAtom.reportRead();
    return super.accountWalletTransactions;
  }

  @override
  set accountWalletTransactions(List<WalletTransaction> value) {
    _$accountWalletTransactionsAtom
        .reportWrite(value, super.accountWalletTransactions, () {
      super.accountWalletTransactions = value;
    });
  }

  final _$totalSpendingAtom =
      Atom(name: '_WalletTransactionStore.totalSpending');

  @override
  String get totalSpending {
    _$totalSpendingAtom.reportRead();
    return super.totalSpending;
  }

  @override
  set totalSpending(String value) {
    _$totalSpendingAtom.reportWrite(value, super.totalSpending, () {
      super.totalSpending = value;
    });
  }

  final _$getHomeWalletTransactionAsyncAction =
      AsyncAction('_WalletTransactionStore.getHomeWalletTransaction');

  @override
  Future<String> getHomeWalletTransaction() {
    return _$getHomeWalletTransactionAsyncAction
        .run(() => super.getHomeWalletTransaction());
  }

  final _$getAccountWalletTransactionAsyncAction =
      AsyncAction('_WalletTransactionStore.getAccountWalletTransaction');

  @override
  Future<String> getAccountWalletTransaction(
      {String startDate, String endDate}) {
    return _$getAccountWalletTransactionAsyncAction.run(() => super
        .getAccountWalletTransaction(startDate: startDate, endDate: endDate));
  }

  @override
  String toString() {
    return '''
homeWalletTransactions: ${homeWalletTransactions},
accountWalletTransactions: ${accountWalletTransactions},
totalSpending: ${totalSpending}
    ''';
  }
}
