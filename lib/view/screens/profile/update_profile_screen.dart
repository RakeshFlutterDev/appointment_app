// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jazeera_paints/util/styles.dart';
import 'package:jazeera_paints/view/base/custom_app_bar.dart';
import 'package:jazeera_paints/view/base/custom_snack_bar.dart';
import 'package:jazeera_paints/view/screens/login/widget/phone_number_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}
class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  File? _profileImage; // Added "?" to make it nullable

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('Select Image Source'),
            actions: [
              TextButton(
                child: Text('Camera'),
                onPressed: () => Navigator.pop(context, ImageSource.camera),
              ),
              TextButton(
                child: Text('Gallery'),
                onPressed: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;

      // Show success snackbar
      showCustomSnackBar('Profile updated successfully',isError: false);
    } else {
      // Show error snackbar
      showCustomSnackBar('Please enter valid information');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile', isBackButtonExist: true, onBackPressed: (){Navigator.pop(context);},
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/images/avatar.png') as ImageProvider,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0, right: 0, top: 0, left: 0,
                          child: InkWell(
                            onTap: _selectProfileImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3), shape: BoxShape.circle,
                                border: Border.all(width: 1, color: Colors.white),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Center(child: Text('John Doe',style: robotoRegular.copyWith(fontSize: 25),)),

                ],
              ),
              SizedBox(height: 60.0),
              Text('Personal Info',style: robotoRegular.copyWith(fontSize: 20),),
              SizedBox(height: 20.0),
              PhoneNumberField(
                controller: _titleController,
                hintText: 'Title',
              ),
              SizedBox(height: 16.0),
              PhoneNumberField(
                controller: _firstNameController,
                hintText: 'First Name',
              ),
              SizedBox(height: 16.0),
              PhoneNumberField(
                controller: _lastNameController,
                hintText: 'Last Name',
              ),
              SizedBox(height: 16.0),
              PhoneNumberField(
                controller: _phoneNumberController,
                hintText: 'PhoneNumber',
              ),
              SizedBox(height: 16.0),
              PhoneNumberField(
                controller: _emailController,
                hintText: 'Email Address',
              ),
              SizedBox(height: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Update Profile'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
