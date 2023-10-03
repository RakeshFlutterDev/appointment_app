import 'package:flutter/material.dart';

class TextValidator {
  static String? validate(String? value, {int minLength = 0, int maxLength = 100}) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < minLength) {
      return 'This field must be at least $minLength characters long.';
    }
    if (value.length > maxLength) {
      return 'This field must be less than $maxLength characters long.';
    }
    // Add any other validation logic here.
    return null;
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PhoneNumberField({Key? key, required this.controller, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  bottomLeft: Radius.circular(5.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
                validator: (value) => TextValidator.validate(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
