// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jazeera_paints/helper/responsive_helper.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/forget/forget_pass_screen.dart';
import 'package:jazeera_paints/view/screens/home/widget/web_app_bar.dart';
import 'package:jazeera_paints/view/screens/login/registation_screen.dart';
import 'package:jazeera_paints/view/screens/login/widget/phone_number_field.dart';
import 'package:jazeera_paints/view/screens/otp/otp_verify_screen.dart';


class MobileNumberLoginScreen extends StatefulWidget {
  final bool exitFromApp;
  const MobileNumberLoginScreen({super.key, required this.exitFromApp});


  @override
  State<MobileNumberLoginScreen> createState() => _MobileNumberLoginScreenState();
}

class _MobileNumberLoginScreenState extends State<MobileNumberLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool _canExit = GetPlatform.isWeb ? true : false;


  bool rememberMe = false;

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _isLogin(String enteredCode) async{
    const String expectedCode = "9999999999";
    if (enteredCode == expectedCode) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OtpScreen()),
      );
    } else {
      showCustomSnackBar('Please Enter Valid Mobile Number');
    }
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen()));
  //   }
  // }

  void _toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if(widget.exitFromApp) {
            if (_canExit) {
              if (GetPlatform.isAndroid) {
                SystemNavigator.pop();
              } else if (GetPlatform.isIOS) {
                exit(0);
              } else {
                Navigator.pushNamed(context, '/login');
              }
              return Future.value(false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Back press again to exit'.tr, style: TextStyle(color: Colors.white)),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
                margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              ));
              _canExit = true;
              Timer(Duration(seconds: 2), () {
                _canExit = false;
              });
              return Future.value(false);
            }
          }else {
            return true;
          }
        },
        child: SafeArea(
          child: Scaffold(
            appBar: ResponsiveHelper.isDesktop(context) ? WebAppBar() : AppBar(
              backgroundColor: ResponsiveHelper.isDesktop(context) ? Colors.transparent : Theme.of(context).colorScheme.background,
                leading: IconButton(onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_rounded, color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
            ),
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("Welcome Back!",style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30.0,
                          )),
                          SizedBox(height: 30.0,),
                          Text('Login With Social media', style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 30.0),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children:  [
                              Container(
                                height: 40,width: 40,
                                padding: EdgeInsets.zero,
                                child:GestureDetector(
                                  onTap: (){
                                    showCustomSnackBar('Please use demo login credentials');
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/twitter.png'),
                                    height: 30,width: 30,
                                  ),
                                ) ,
                              ),
                              SizedBox(height: 10.0,width: 20.0,),
                              Container(
                                height: 40,width: 40,
                                padding: EdgeInsets.zero,
                                child:GestureDetector(
                                  onTap: (){
                                    showCustomSnackBar('Please use demo login credentials');
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/google.png'),
                                    height: 30,width: 30,
                                  ),
                                ) ,
                              ),
                              SizedBox(height: 10.0, width: 20.0,),
                              Container(
                                height: 40,width: 40,
                                padding: EdgeInsets.zero,
                                child:GestureDetector(
                                  onTap: (){
                                    showCustomSnackBar('Please use demo login credentials');
                                  },
                                  child: Image(
                                    image: AssetImage('assets/images/apple.png'),
                                    height: 30,width: 30,
                                  ),
                                ) ,
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0,),
                          Divider(thickness: 1, color: Colors.grey ),
                          SizedBox(height: 30.0,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    // Set pre-filled login details
                                    // For example:
                                    const String preFilledUsername = '9999999999';

                                    // Update the text fields with pre-filled values
                                    // You can use a TextEditingController to achieve this
                                    // Assuming you have the TextFields defined as instance variables
                                    _phoneNumberController.text = preFilledUsername;
                                  },
                                  child: Text(
                                    'Tap here for pre-filled demo login details',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              SizedBox(height: 10,),
                              PhoneNumberField(
                                controller: _phoneNumberController,
                                hintText: 'Enter Mobile number',
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) => _toggleRememberMe(),
                                  ),
                                  Text('Remember me'),
                                  Spacer(),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassScreen()));
                                    },
                                    child: Text('Forgot Password'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              ElevatedButton(
                                  onPressed: () {
                                    _isLogin(_phoneNumberController.text);
                                  },
                                  child: Text('Continue')),
                              SizedBox(
                                height: 16.0,
                              ),
                              Center(
                                child: Text(
                                  'New Member? ',style: TextStyle(
                                  fontSize: 20.0,
                                ),),
                              ),
                              Center(
                                child: Text(
                                  'Welcome to Jazeera Paints!',style: TextStyle(fontSize: 20.0,
                                ),),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Center(
                                child: Text('Complete your personal details and become a member of our family'),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              OutlinedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      ),
                                    ),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(color: Colors.cyan),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder:(context)=> RegistrationScreen()));
                                  },
                                  child: Text('Create a new account')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
