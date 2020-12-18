// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subsidytransactionstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubsidyTransactionStore on _SubsidyTransactionStore, Store {
  final _$walletSubsidyTransactionAtom =
      Atom(name: '_SubsidyTransactionStore.walletSubsidyTransaction');

  @override
  List<WalletSubsidyTransaction> get walletSubsidyTransaction {
    _$walletSubsidyTransactionAtom.reportRead();
    return super.walletSubsidyTransaction;
  }

  @override
  set walletSubsidyTransaction(List<WalletSubsidyTransaction> value) {
    _$walletSubsidyTransactionAtom
        .reportWrite(value, super.walletSubsidyTransaction, () {
      super.walletSubsidyTransaction = value;
    });
  }

  final _$getWalletSubsidyTransactionAsyncAction =
      AsyncAction('_SubsidyTransactionStore.getWalletSubsidyTransaction');

  @override
  Future<String> getWalletSubsidyTransaction() {
    return _$getWalletSubsidyTransactionAsyncAction
        .run(() => super.getWalletSubsidyTransaction());
  }

  @override
  String toString() {
    return '''
walletSubsidyTransaction: ${walletSubsidyTransaction}
    ''';
  }
}
