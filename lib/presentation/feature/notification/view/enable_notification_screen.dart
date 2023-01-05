import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EnableNotificationScreen extends StatelessWidget {
  const EnableNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16 * 1.5),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                "assets/Illustration/TurnOnNotification_darkTheme.png",
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              const Spacer(),
              Text(
                "Push Notifications are currently turned off",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16),
              const Text(
                "Enabling push notifications allows us to send you info about our new products, sales, events and more!",
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.push(AppRoute.notificationsOption.path);
                },
                child: const Text("Enable Notification"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
