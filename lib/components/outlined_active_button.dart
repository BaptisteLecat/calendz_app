import 'package:flutter/material.dart';

import '../constants/constants.dart';

class OutlinedActiveButton extends StatelessWidget {
  const OutlinedActiveButton({
    Key? key,
    required this.text,
    required this.press,
    this.isActive = false,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: isActive
          ? OutlinedButton.styleFrom(
              backgroundColor: primaryColor, primary: Colors.white)
          : null,
      child: Text(text),
    );
  }
}
