import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomCard({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        OutlinedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Colors.blue),
            ),
          ),
          onPressed: onPressed,
          child: Text(title,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.fontSizeSmall,
              )),
        ),
      ]),
    );
  }
}
