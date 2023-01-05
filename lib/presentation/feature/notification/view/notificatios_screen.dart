import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        // For no notification use
        // NoNotification()
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => NotificationCard(
            title: "Molestie libero neque sem cras enim, amet.",
            svgSrc: index.isEven
                ? "assets/icons/Discount.svg"
                : "assets/icons/diamond.svg",
            time: "2 min ago",
            iconBgColor: index.isEven
                ? const Color(0xFFF3B923)
                : Theme.of(context).primaryColor,
            isRead: index > 2,
          ),
        ),
      ),
    );
  }
}
