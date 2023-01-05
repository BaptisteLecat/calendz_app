import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/no_notification.dart';

class NoNotificationScreen extends StatelessWidget {
  const NoNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/DotsV.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
      ),
      body: const SafeArea(child: NoNotification()),
    );
  }
}
