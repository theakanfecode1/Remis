import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';
import 'package:remis/utils/wallet/wallettransaction.dart';

part 'wallettransactionstore.g.dart';

class WalletTransactionStore = _WalletTransactionStore with _$WalletTransactionStore;

abstract class _WalletTransactionStore with Store{
  @observable
  List<WalletTransaction> homeWalletTransactions = List<WalletTransaction>().asObservable();

  @observable
  List<WalletTransaction> accountWalletTransactions = List<WalletTransaction>().asObservable();

  @observable
  String totalSpending = "";

  @action
  Future<String> getHomeWalletTransaction() async {
    dynamic result = await HttpRequestModel.getHomeTransaction();
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
      List<WalletTransaction> homeWalletTransactionsTemp = List<WalletTransaction>();

      result["object"].forEach((element) {
        var splitDate = element.date.toString().split("T");
        String time =DateFormat.jm().format(DateTime.parse(element.date));
        String date = DateFormat.yMMMd().format(DateTime.parse(splitDate[0]));

        String finalDate = date +" "+ time;

        homeWalletTransactionsTemp.add(WalletTransaction(
            amount: element.amount,
            source: element.source,
            status: element.status,
            walletId: element.walletId,
            description: element.description,
            currentBalance: element.currentBalance,
            id: element.id,
            date: finalDate,
            uniqueId: element.uniqueId
        ));
      });
      homeWalletTransactions = homeWalletTransactionsTemp;
      return NetworkCallsMessages.successful;
    }
  }
  @action
  Future<String> getAccountWalletTransaction({String startDate,String endDate}) async {
    dynamic result = await HttpRequestModel.getAccountTransaction(startDate, endDate);
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
      accountWalletTransactions = result["object"];
      double total = 0;
      accountWalletTransactions.forEach((element) {
        if(element.status == "Debit"){
          total += double.parse(element.amount);
          print(total);
        }
      });
      totalSpending = total.toString();
      List<WalletTransaction> accountWalletTransactionsTemp = List<WalletTransaction>();

      result["object"].forEach((element) {
        var splitDate = element.date.toString().split("T");
        String time =DateFormat.jm().format(DateTime.parse(element.date));
        String date = DateFormat.yMMMd().format(DateTime.parse(splitDate[0]));

        String finalDate = date +" "+ time;

        accountWalletTransactionsTemp.add(WalletTransaction(
            amount: element.amount,
            source: element.source,
            status: element.status,
            walletId: element.walletId,
            description: element.description,
            currentBalance: element.currentBalance,
            id: element.id,
            date: finalDate,
            uniqueId: element.uniqueId
        ));
      });
      accountWalletTransactions = accountWalletTransactionsTemp;
      return NetworkCallsMessages.successful;
    }
  }

}