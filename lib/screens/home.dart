import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:remis/networkcalls/httprequest.dart';
import 'package:remis/screens/addfund.dart';
import 'package:remis/screens/loadingScreen.dart';
import 'package:remis/stores/accountloggedinstore.dart';
import 'package:remis/screens/airtime.dart';
import 'package:remis/screens/diesel_delivery.dart';
import 'package:remis/screens/paybills.dart';
import 'package:remis/screens/qrcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:remis/screens/transfer_details.dart';
import 'package:remis/stores/walletbalancestore.dart';
import 'package:remis/stores/wallettransactionstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic current;
  String time = "";
  String timeState = "";
  bool hideBalance = true;
  bool fetchedBalance = false;
  void checkDate() {
    setState(() {
      current = DateFormat.jm().format(DateTime.now());
      var theFormat = current.toString().split(" ");
      time = theFormat[1];
      if (time == "AM") {
        timeState = "Good Morning";
      } else {
        var afternoonFormat = theFormat[0].toString().split(":");
        if (int.parse(afternoonFormat[0].toString()) > 4) {
          timeState = "Good Evening";
        } else {
          timeState = "Good Afternoon";
        }
      }
    });
  }

  Future<void> getBalance() async {
    final balanceStore = Provider.of<WalletBalanceStore>(context);
    balanceStore.walletBalance.balance ="";
    String result = await balanceStore.getBalance();
    if (result == NetworkCallsMessages.successful) {}
  }
  Future<void> getWalletFunding() async {
    final fundStore = Provider.of<WalletBalanceStore>(context);
    String result = await fundStore.getWalletFundProperties();
    if (result == NetworkCallsMessages.successful) {}
  }
  Future<void> getTransaction() async {
    final walletTransaction = Provider.of<WalletTransactionStore>(context);
    walletTransaction.homeWalletTransactions.clear();
    String result = await walletTransaction.getHomeWalletTransaction();
    if (result == NetworkCallsMessages.successful) {}
  }

  @override
  void initState() {
    super.initState();

  }

  void getData() async{
    await getBalance();
    Navigator.of(context,rootNavigator: true).pop();
    await getTransaction();
    getWalletFunding();

    setState(() {
      fetchedBalance = true;

    });

  }


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(!fetchedBalance){
        Navigator.of(context,rootNavigator: true).push(LoadingScreen.showLoadingScreen("Loading History"));

      }

    });
    final loginStore = Provider.of<AccountLoggedInStore>(context);
    final transactionStore = Provider.of<WalletTransactionStore>(context);
    final balanceStore = Provider.of<WalletBalanceStore>(context);
    if(!fetchedBalance) {
      getData();
    }
    checkDate();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) => Text(
            timeState + "," + "${loginStore.user.firstName}",
            style: TextStyle(fontFamily: "NunitoBold", fontSize: 18),
          ),
        ),
        backgroundColor: Color(0xff1A3365),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                'assets/bell.svg',
                color: Colors.white,
              ),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: current,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  toastLength: Toast.LENGTH_LONG,
                );
              })
        ],
      ),
      backgroundColor: Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 115,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff1A3365)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 40),
                          Text(
                            "Balance",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                color: Color(0xffFFBB00),
                                fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          RaisedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (BuildContext context) => AddFund(),
                                  maintainState: false));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            icon: SvgPicture.asset(
                              "assets/plus.svg",
                              color: Colors.white,
                            ),
                            label: Text(
                              "Add Funds",
                              style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            color: Color(0xff081736),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hideBalance = !hideBalance;
                              });
                            },
                            child: Observer(
                              builder: (_) => Text(
                                hideBalance
                                    ? "XX.XX"
                                    : "₦"+balanceStore.walletBalance.balance,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "MontserratSemiBold",
                                    fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 132,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffE6EFFF)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 28, 0, 28),
                        child: Image.asset("assets/qrphone.png"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Buy Fuel",
                            style: TextStyle(
                                fontFamily: "NunitoSemiBold", fontSize: 20),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Introducing an easy way to fuel",
                            style: TextStyle(fontFamily: "Nunito", fontSize: 15),
                          ),
                          RaisedButton.icon(
                            color: Color(0xff1A3365),
                            onPressed: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      QrCodeScanner(),
                                  maintainState: false));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            icon: SvgPicture.asset(
                              "assets/scan.svg",
                              color: Colors.white,
                            ),
                            label: Text(
                              "Scan to pay",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) => DieselDelivery(),
                          maintainState: false)),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/tank.svg",
                                color: Color(0xff1A3365),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Diesel Delivery",
                                style: TextStyle(
                                    color: Color(0xff1A3365),
                                    fontSize: 15,
                                    fontFamily: "Nunito"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) => TransferDetails(),
                          maintainState: false)),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                tag: "transfer",
                                child: SvgPicture.asset(
                                  "assets/transfer.svg",
                                  color: Color(0xff1A3365),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Transfer",
                                style: TextStyle(
                                    color: Color(0xff1A3365),
                                    fontSize: 15,
                                    fontFamily: "Nunito"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) =>
                              Airtime(),
                          maintainState: false)),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        elevation: 2,
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                tag: "touch-screen",
                                child: SvgPicture.asset(
                                  "assets/touch-screen.svg",
                                  color: Color(0xff1A3365),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Buy Airtime",
                                style: TextStyle(
                                    color: Color(0xff1A3365),
                                    fontSize: 15,
                                    fontFamily: "Nunito"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) => PayBills(),
                          maintainState: false)),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Hero(
                                tag: "pay-bills",
                                child: SvgPicture.asset(
                                  "assets/business.svg",
                                  color: Color(0xff1A3365),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Pay Bills",
                                style: TextStyle(
                                    color: Color(0xff1A3365),
                                    fontSize: 15,
                                    fontFamily: "Nunito"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(fontFamily: "NunitoSemiBold", fontSize: 17),
                  ),
                ),
                if(fetchedBalance)Observer(
                  builder:(_) => ListView.builder(
                      itemCount: transactionStore.homeWalletTransactions.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(transactionStore.homeWalletTransactions[index].description == null   ?"":transactionStore.homeWalletTransactions[index].description,style: TextStyle(
                                    fontFamily: "NunitoSemiBold",
                                    fontSize: 17,
                                    color: Color(0xff1A3365),
                                  ),),
                                  Text("₦"+transactionStore.homeWalletTransactions[index].amount,
                                    style: TextStyle(
                                        color: transactionStore.homeWalletTransactions[index].status == "Debit" ? Colors.red : Colors.green,
                                        fontFamily: "NunitoSemiBold",
                                        fontSize: 17
                                    ),),
                                ],
                              ),
                              leading: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xffE6EFFF)),
                                  ),
                                  SvgPicture.asset( transactionStore.homeWalletTransactions[index].description == null || transactionStore.homeWalletTransactions[index].description.toString().contains("CARD",0)? "assets/money.svg": "assets/touch-screen.svg",
                                    width:transactionStore.homeWalletTransactions[index].description == null || transactionStore.homeWalletTransactions[index].description.toString().contains("CARD",0)? 28: 20,
                                    color: Color(0xff1A3365),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
