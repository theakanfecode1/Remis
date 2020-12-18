import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';
import 'package:remis/utils/wallet/walletsubsidytransaction.dart';

part 'subsidytransactionstore.g.dart';

class SubsidyTransactionStore = _SubsidyTransactionStore
    with _$SubsidyTransactionStore;

abstract class _SubsidyTransactionStore with Store {
  @observable
  List<WalletSubsidyTransaction> walletSubsidyTransaction =
      List<WalletSubsidyTransaction>().asObservable();

  @action
  Future<String> getWalletSubsidyTransaction() async {
    dynamic result = await HttpRequestModel.getSubsidyTransaction();
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
      List<WalletSubsidyTransaction> walletSubsidyTransactionTemp =
          List<WalletSubsidyTransaction>();
      result["object"].forEach((element) {
        var splitDate = element.date.toString().split("T");
        String time =DateFormat.jm().format(DateTime.parse(element.date));
        String date = DateFormat.yMMMd().format(DateTime.parse(splitDate[0]));

        String finalDate = date +" "+ time;

        walletSubsidyTransactionTemp.add(WalletSubsidyTransaction(
          amount: element.amount,
          title: element.title,
          status: element.status,
          walletId: element.walletId,
          description: element.description,
          walletTransactionId: element.walletTransactionId,
          id: element.id,
          date: finalDate
        ));
      });
      walletSubsidyTransaction = walletSubsidyTransactionTemp;
      return NetworkCallsMessages.successful;
    }
  }
}
