import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remis/screens/fuelamount.dart';
import 'package:remis/screens/loginPage.dart';
import 'package:remis/screens/siginUpPage.dart';
import 'package:remis/screens/controller.dart';
import 'package:remis/stores/accountloggedinstore.dart';
import 'package:remis/stores/branchnearbystore.dart';
import 'package:remis/stores/changeprofileorpasswordstore.dart';
import 'package:remis/stores/signupstore.dart';
import 'package:remis/stores/subsidytransactionstore.dart';
import 'package:remis/stores/walletbalancestore.dart';
import 'package:remis/stores/wallettransactionstore.dart';
import 'package:remis/stores/buyairtimestore.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<AccountLoggedInStore>(create: (_) => AccountLoggedInStore()),
        Provider<SignUpStore>(create: (_) => SignUpStore(),),
        Provider<WalletBalanceStore>(create: (_) => WalletBalanceStore(),),
        Provider<WalletTransactionStore>(create: (_) => WalletTransactionStore(),),
        Provider<ChangeProfileOrPasswordStore>(create: (_) => ChangeProfileOrPasswordStore(),),
        Provider<SubsidyTransactionStore>(create: (_) => SubsidyTransactionStore(),),
        Provider<BranchNearbyStore>(create: (_) => BranchNearbyStore(),),
        Provider<BuyAirtimeStore>(create: (_) => BuyAirtimeStore(),),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Color(0xff1A3365),
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/controller': (context) => Controller(),
          '/fuelamount': (context) => FuelAmount(),
        },
      ),
    ),
  );
}
