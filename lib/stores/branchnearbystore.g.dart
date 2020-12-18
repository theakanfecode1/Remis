// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branchnearbystore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BranchNearbyStore on _BranchNearbyStore, Store {
  final _$nearbyBranchesAtom = Atom(name: '_BranchNearbyStore.nearbyBranches');

  @override
  List<BranchNearby> get nearbyBranches {
    _$nearbyBranchesAtom.reportRead();
    return super.nearbyBranches;
  }

  @override
  set nearbyBranches(List<BranchNearby> value) {
    _$nearbyBranchesAtom.reportWrite(value, super.nearbyBranches, () {
      super.nearbyBranches = value;
    });
  }

  final _$getNearbyBranchesAsyncAction =
      AsyncAction('_BranchNearbyStore.getNearbyBranches');

  @override
  Future<String> getNearbyBranches({String latitude, String longitude}) {
    return _$getNearbyBranchesAsyncAction.run(() =>
        super.getNearbyBranches(latitude: latitude, longitude: longitude));
  }

  @override
  String toString() {
    return '''
nearbyBranches: ${nearbyBranches}
    ''';
  }
}
