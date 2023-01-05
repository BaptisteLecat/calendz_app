import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ChatActiveDot extends StatelessWidget {
  const ChatActiveDot({
    Key? key,
    this.dotColor = successColor,
  }) : super(key: key);
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: dotColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
