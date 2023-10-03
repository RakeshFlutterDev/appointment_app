import 'package:flutter/material.dart';

class CustomBoxWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const CustomBoxWidget({Key? key, required this.child, required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
