import 'package:calendz_app/components/chat_active_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.title,
    this.svgSrc = "assets/icons/Notification.svg",
    required this.time,
    this.isRead = false,
    this.press,
    this.iconBgColor = const Color(0xFFE5614F),
  }) : super(key: key);

  final String title, svgSrc, time;
  final bool isRead;
  final Color iconBgColor;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          leading: Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: iconBgColor,
                child: SvgPicture.asset(
                  svgSrc,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              if (!isRead)
                const ChatActiveDot(
                  dotColor: Color(0xFFE5614F),
                ),
            ],
          ),
          title: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            time,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
