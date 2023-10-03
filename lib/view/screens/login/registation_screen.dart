// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/login/login_screen.dart';
import 'package:jazeera_paints/view/screens/login/widget/phone_number_field.dart';
import 'package:jazeera_paints/view/screens/otp/otp_verify_screen.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  bool rememberMe = false;
  bool privacyPolicy = false;
  bool painter = false;


  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder:(context)=> OtpScreen()));
    }
  }

  void _toggleRememberMe() {
    setState(() {
      rememberMe = !rememberMe;
    });
  }

  void _togglePrivacyPolicy() {
    setState(() {
      privacyPolicy = !privacyPolicy;

    });
  }
  void _togglePainter() {
    setState(() {
      painter = !painter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text('Welcome to Jazeera Paints Family',
                style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20.0,
                ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('Register With Social media',style: TextStyle(
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
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'First Name'),
                      SizedBox(
                        height: 10.0,
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'Last Name'),
                      SizedBox(
                        height: 10.0,
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'E-mail Address'),
                      SizedBox(
                        height: 10.0,
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'Mobile number'),
                      SizedBox(
                        height: 10.0,
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'Password'),
                      Row(
                        children: [
                          Checkbox(
                            value: painter,
                            onChanged: (value) => _togglePainter(),
                          ),
                          Text('I am a Painter'),
                        ],
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'National ID Number'),
                      SizedBox(
                        height: 10.0,
                      ),
                      PhoneNumberField(
                          controller: _phoneNumberController,
                          hintText: 'Upload National ID'),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) => _toggleRememberMe(),
                          ),
                          Text('Remember Me'),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: privacyPolicy,
                            onChanged: (value) => _togglePrivacyPolicy(),
                          ),
                          Text('I agree to the',style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault)),
                          InkWell(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Privacy Policy",style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Colors.blue),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                                child: ElevatedButton(
                                  onPressed: (){},
                                  child: Text('+Select File'),
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text('Create a new account')),
                      SizedBox(
                        height: 16.0,
                      ),
                      Center(
                        child: Text(
                          'Already a member? ' 'Welcome Back!',style: TextStyle(
                          fontSize: 20.0,
                        ),),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Center(
                        child: Text('Please Login with your personal data'),
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
                            Navigator.push(context, MaterialPageRoute(builder:(context)=> LoginScreen(exitFromApp: true,)));
                          },
                          child: Text('Sign In')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


