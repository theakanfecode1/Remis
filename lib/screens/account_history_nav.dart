import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/stores/wallettransactionstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';
import 'package:remis/screens/filter_widget.dart';

class AccountHistoryNav extends StatefulWidget {
  @override
  _AccountHistoryNavState createState() => _AccountHistoryNavState();
}

class _AccountHistoryNavState extends State<AccountHistoryNav>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;
  var dateTime = "";
  var startDate;
  var endDate;
  bool fetchedData = false;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  filterDate(start, end) async{
    var date = DateTime.now();
    var newDt = DateFormat.yMMMd().format(date);
    String today = (newDt).toString();
    if (start == today && end == today) {
      setState(() {
        dateTime = today;
        startDate = today;
        endDate = today;

      });
    } else {
      setState(() {
        dateTime = start + " - " + end;
        startDate = start;
        endDate = end;
      });
    }
    final walletTransaction = Provider.of<WalletTransactionStore>(context);
    Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Loading Transactions"));

    String result = await walletTransaction.getAccountWalletTransaction(startDate: startDate,endDate: endDate);
    Navigator.of(context,rootNavigator: true).pop();


  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animation.addStatusListener((status) {});
    _animationController.forward();

    var date = DateTime.now();
    var newDt = DateFormat.yMMMd().format(date);
    dateTime = (newDt).toString();
    startDate = dateTime;
    endDate = dateTime;


  }

//  filterDates(first,end) =>
//   setState(() =>
//     dateTime = first +" - "+end
//   );
//  }
  void getTransaction(String startDate,String endDate) async {
    final walletTransaction = Provider.of<WalletTransactionStore>(context);
    String result = await walletTransaction.getAccountWalletTransaction(startDate: startDate,endDate: endDate);
    if (result == NetworkCallsMessages.successful) {}
    fetchedData = true;
    Navigator.of(context,rootNavigator: true).pop();

  }
  @override
  Widget build(BuildContext context) {
    final transactionStore = Provider.of<WalletTransactionStore>(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(!fetchedData){
        Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Loading Transactions"));

      }
    });
    if(!fetchedData){
      transactionStore.accountWalletTransactions.clear();
      transactionStore.totalSpending ="0.0";
      getTransaction(startDate,endDate);

    }
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Account History",
          style: TextStyle(
            fontFamily: "NunitoSemiBold",
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                "assets/filter.svg",
                color: Colors.white,
              ),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    builder: (context) => FilterWidget(
                          func: filterDate,
                        ));
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff1A3365),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                SvgPicture.asset(
                  "assets/money.svg",
                  width: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  "Total Spending",
                  style: TextStyle(
                      color: Color(0xffFFBB00),
                      fontSize: 20,
                      fontFamily: "Nunito"),
                ),
                SizedBox(height: 15),
                Observer(
                  builder:(_)=> Text("₦"+
                    transactionStore.totalSpending,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "NunitoSemiBold",
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Hero(
              tag: "date",
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  dateTime,
                  style: TextStyle(
                      color: Color(0xff1A3365),
                      fontSize: 15,
                      fontFamily: "MontserratMedium"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Observer(
              builder:(_)=> RefreshIndicator(
                key: refreshKey,
                onRefresh: () async {
                  refreshKey.currentState.show(atTop: true);
                  await transactionStore.getAccountWalletTransaction(startDate: startDate,endDate: endDate);

                },
                child: ListView.builder(
                    itemCount: transactionStore.accountWalletTransactions.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizeTransition(
                        sizeFactor: _animationController,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            elevation: 0,
                            child: ListTile(
                              title: Text(
                                transactionStore.accountWalletTransactions[index].source,
                                style: TextStyle(
                                    color: Color(0xff1A3365),
                                    fontSize: 16,
                                    fontFamily: "NunitoBold"),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      color: Color(0xff515151),
                                      fontSize: 20,
                                      fontFamily: "NunitoBold"),
                                ),
                              ),
                              leading: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Color(0xffDAE3F5),
                                    radius: 25,
                                  ),
                                  SvgPicture.asset(
                                    "assets/money.svg",
                                    color: Color(0xff1A3365),
                                    width: 33,
                                  )
                                ],
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "₦"+transactionStore.accountWalletTransactions[index].amount,
                                    style: TextStyle(
                                        color: transactionStore.accountWalletTransactions[index].status == "Debit"?Colors.red:Colors.green,
                                        fontSize: 17,
                                        fontFamily: "NunitoSemiBold"),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                   transactionStore.accountWalletTransactions[index].date,
                                    style: TextStyle(
                                        color: Color(0xffC8C8C8),
                                        fontSize: 13,
                                        fontFamily: "Nunito"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
