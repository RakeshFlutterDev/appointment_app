import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: CustomAppBar(title: 'Terms & Conditions', isBackButtonExist:true, onBackPressed: (){Navigator.pop(context);},),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Terms & Conditions for Jazeera Paints',style: robotoBold.copyWith(fontSize: 16),),
          ],
        ),
      ),
    ),
    );
  }
}
