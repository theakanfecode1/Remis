import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:remis/stores/subsidytransactionstore.dart';
import 'package:remis/values/strings/networkcallsmessgaes.dart';

class BonusAccount extends StatefulWidget {
  @override
  _BonusAccountState createState() => _BonusAccountState();
}

class _BonusAccountState extends State<BonusAccount> {

  void getTransaction() async {
    final subsidyTransaction = Provider.of<SubsidyTransactionStore>(context);
    String result = await subsidyTransaction.getWalletSubsidyTransaction();
    Fluttertoast.showToast(msg: result + "Transaction");
    if (result == NetworkCallsMessages.successful) {}
  }
  @override
  Widget build(BuildContext context) {
    final subsidyTransaction = Provider.of<SubsidyTransactionStore>(context);
    getTransaction();
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1A3365),
        title: Text(
          "Bonus Account",
          style: TextStyle(
            fontFamily: "NunitoSemiBold",
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff1A3365),
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                SvgPicture.asset(
                  "assets/salehand.svg",
                  width: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 40),
                Text(
                  "Bonus",
                  style: TextStyle(
                      color: Color(0xffFFBB00),
                      fontSize: 20,
                      fontFamily: "Nunito"),
                ),
                SizedBox(height: 15),
                Text(
                  "₦0.00",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "NunitoSemiBold",
                      fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Text(
              "Recent Bonus History",
              style: TextStyle(
                  color: Color(0xff1A3365),
                  fontSize: 15,
                  fontFamily: "MontserratMedium"),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Observer(
                builder:(_) => ListView.builder(
                    itemCount: subsidyTransaction.walletSubsidyTransaction.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: CardContainer(
                          title:subsidyTransaction.walletSubsidyTransaction[index].title,
                          description: subsidyTransaction.walletSubsidyTransaction[index].description,
                          date: subsidyTransaction.walletSubsidyTransaction[index].date,
                          amount: subsidyTransaction.walletSubsidyTransaction[index].amount,
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

class CardContainer extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String amount;

  CardContainer({this.title, this.description, this.date, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xffDAE3F5),
                radius: 20,
              ),
              SvgPicture.asset(
                "assets/salehand.svg",
                color: Color(0xff1A3365),
                width: 27,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Color(0xff1A3365),
                              fontSize: 15,
                              fontFamily: "NunitoSemiBold"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            color: Color(0xff515151),
                            fontSize: 15,
                            fontFamily: "Nunito"),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      amount,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontFamily: "NunitoSemiBold"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      date,
                      style: TextStyle(
                          color: Color(0xff515151),
                          fontSize: 15,
                          fontFamily: "Nunito"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
