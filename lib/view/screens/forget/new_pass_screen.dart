// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/login/widget/phone_number_field.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({Key? key}) : super(key: key);

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}
class _NewPassScreenState extends State<NewPassScreen> {
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic
      String newPassword = _newPassController.text;
      String confirmPassword = _confirmPassController.text;

      // Show success snackbar
      showCustomSnackBar('Password updated successfully',isError: false);
    } else {
      // Show error snackbar
      showCustomSnackBar('Please enter valid password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'New Password', isBackButtonExist: true, onBackPressed: (){Navigator.pop(context);},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter New Password',style: robotoRegular.copyWith(fontSize: 14),),
                  SizedBox(height: 20,),
                  PhoneNumberField(
                    controller: _newPassController,
                    hintText: 'New Password',
                  ),
                  SizedBox(height: 16.0),
                  PhoneNumberField(
                    controller: _confirmPassController,
                    hintText: 'Re-Enter Password',
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Update Password'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
