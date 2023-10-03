import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        appBar: CustomAppBar(title: 'Privacy Policy', isBackButtonExist:true, onBackPressed: (){Navigator.pop(context);},),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Privacy Policy for Jazeera Paints',style: robotoBold.copyWith(fontSize: 16),),
            ],
          ),
        ),
    ),
    );
  }
}
