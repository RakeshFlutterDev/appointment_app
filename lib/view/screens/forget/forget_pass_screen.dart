import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/images.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';
import 'package:jazeera_paints/view/screens/dashboard/dashboard_screen.dart';
import 'package:jazeera_paints/view/screens/forget/forget_otp_screen.dart';
import 'package:jazeera_paints/view/screens/login/widget/phone_number_field.dart';
import 'package:jazeera_paints/view/screens/otp/otp_verify_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Forget Password',
          onBackPressed: () {
            Navigator.pop(context);
          },
        ),
        body: SafeArea(child: Center(
          child: Scrollbar(
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Center(
                    child: Container(
                      width: context.width > 700 ? 700 : context.width,
                      padding: context.width > 700 ? EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT) : null,
                      decoration: context.width > 700 ? BoxDecoration(color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5, spreadRadius: 1)],) : null,
                      child: Column(children: [
                        Image.asset(Images.logo, height: 220),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Text('Enter your details below'.tr, style: robotoRegular, textAlign: TextAlign.center),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PhoneNumberField(
                                controller: _numberController,
                                hintText: 'Enter E-mail Address or Mobile Number',
                              ),
                              SizedBox(height: 16.0,),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ForgetOtpScreen()),
                                    );
                                  },
                                  child: Text('Continue')),
                              SizedBox(height: 16.0,),
                            ],
                        ),
                      ]),
                    ),
                  ),
              ),
          ),
        )),
    );
  }
}
