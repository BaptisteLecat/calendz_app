import 'package:flutter/material.dart';

import 'components/cupertino_switch_divided_list_tile.dart';

class NotificationOptionsScreen extends StatelessWidget {
  const NotificationOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Reset"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            CupertinoSwitchDividedListTile(
              title: "Allow Notification",
              value: true,
              onChanged: (value) {},
            ),
            CupertinoSwitchDividedListTile(
              title: "Discount notifications",
              subTitle: "At a mauris volutpat cras vitae convallis gravida.",
              value: true,
              onChanged: (value) {},
            ),
            CupertinoSwitchDividedListTile(
              title: "Stores notifications",
              subTitle: "At a mauris volutpat cras vitae convallis gravida.",
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitchDividedListTile(
              title: "System notifications",
              subTitle: "At a mauris volutpat cras vitae convallis gravida.",
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitchDividedListTile(
              title: "Location notifications",
              subTitle: "At a mauris volutpat cras vitae convallis gravida.",
              value: false,
              onChanged: (value) {},
            ),
            CupertinoSwitchDividedListTile(
              title: "Payment notifications",
              subTitle: "At a mauris volutpat cras vitae convallis gravida.",
              value: true,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
