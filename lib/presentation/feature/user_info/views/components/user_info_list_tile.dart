import 'package:flutter/material.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({
    Key? key,
    required this.leadingText,
    required this.trailingText,
  }) : super(key: key);

  final String leadingText, trailingText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(leadingText),
          trailing: Text(
            trailingText,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const Divider(height: 16 / 2),
      ],
    );
  }
}
