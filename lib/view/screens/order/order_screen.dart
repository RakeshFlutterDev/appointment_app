import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/images.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Orders', isBackButtonExist: false, onBackPressed: (){},),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(Images.no_data,height: 100,width: 100,color: Theme.of(context).disabledColor,),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text('No Orders Found',style: robotoMedium.copyWith(fontSize: 16,color: Theme.of(context).disabledColor),
            ),
          ),
        ],
      ),
    );
  }
}
