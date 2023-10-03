// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jazeera_paints/util/dimensions.dart';
import 'package:jazeera_paints/util/styles.dart';

class ProfileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const ProfileButton({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.PADDING_SIZE_SMALL,
          vertical: Dimensions.PADDING_SIZE_SMALL,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 5)],
        ),
        child: Row(children: [
          Icon(icon, size: 25),
          SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
          Expanded(child: Text(title, style: robotoRegular)),
          SizedBox(),
        ]),
      ),
    );
  }
}
