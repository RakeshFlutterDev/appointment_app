import 'package:flutter/material.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/dashboard/dashboard_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  void _validateOTP(String enteredCode) {
    const String expectedCode = "1234"; // Replace with your expected OTP code

    if (enteredCode == expectedCode) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen(exitFromApp: true,)),
      );
    } else {
      showCustomSnackBar('Invalid OTP. Please enter valid OTP');
    }
  }

  void _resendOTP() {
    // Replace this with your actual resend OTP logic
    showCustomSnackBar('Resending OTP...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'OTP Verification', isBackButtonExist: true, onBackPressed: (){Navigator.pop(context);},),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verify Your Number",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enter the 4 digit code sent to your number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              const Text(
                "Enter Demo OTP 1234",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 35),
                child: PinCodeTextField(
                  controller: _otpController,
                  length: 4,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.slide,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 60,
                    fieldWidth: 60,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(5.0),
                    selectedColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    selectedFillColor: Colors.white,
                    inactiveFillColor:
                        Theme.of(context).disabledColor.withOpacity(0.2),
                    inactiveColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                    activeColor: Theme.of(context).primaryColor.withOpacity(0.4),
                    activeFillColor:
                        Theme.of(context).disabledColor.withOpacity(0.2),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  beforeTextPaste: (text) => true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the 4-digit code';
                    } else if (value.length != 4) {
                      return 'Please enter a 4-digit code';
                    }
                    return null;
                  },
                  onChanged: (String value) {},
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                ),
                onPressed: () {
                  // Call the validation function when the button is pressed
                  _validateOTP(_otpController.text);
                },
                child: const Text("Verify OTP"),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _resendOTP();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Resend OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
