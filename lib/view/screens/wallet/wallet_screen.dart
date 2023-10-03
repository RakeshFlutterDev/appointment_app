import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/images.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Wallet', isBackButtonExist: false, onBackPressed: (){},),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Center(
              child: Image.asset(Images.no_data,height: 100,width: 100,color: Theme.of(context).disabledColor,),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text('Data Not Found',style: robotoMedium.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
