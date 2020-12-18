import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';
import 'package:remis/utils/branch/branchNearby.dart';

part 'branchnearbystore.g.dart';

class BranchNearbyStore = _BranchNearbyStore with _$BranchNearbyStore;

abstract class _BranchNearbyStore with Store{

  @observable
  List<BranchNearby> nearbyBranches = List<BranchNearby>().asObservable();

  @action
  Future<String> getNearbyBranches({String latitude,String longitude}) async {
    dynamic result = await HttpRequestModel.getNearbyBranches(latitude, longitude);
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
      nearbyBranches = result["object"];
      return NetworkCallsMessages.successful;
    }
  }

}
