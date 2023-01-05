import 'package:calendz_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          SocialAccountWidget(
              content: Text("baptiste.lecat44@gmail.com",
                  style: Theme.of(context).textTheme.bodyText1),
              icon: SvgPicture.asset(
                "assets/svg/google.svg",
                height: 26,
              ),
              action: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 28,
                ),
                color: const Color(0xFFE57373),
              )),
          SocialAccountWidget(
              isLinked: false,
              content: Text("Se connecter avec Apple",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Color.fromARGB(255, 182, 182, 182))),
              icon: SvgPicture.asset("assets/svg/apple.svg",
                  height: 26, color: blackColor),
              action: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Iconsax.add5,
                  size: 28,
                ),
                color: Theme.of(context).iconTheme.color,
              ))
        ],
      ),
    );
  }
}

class SocialAccountWidget extends StatelessWidget {
  final Widget content;
  final Widget icon;
  final Widget action;
  final bool isLinked;
  const SocialAccountWidget({
    Key? key,
    required this.content,
    required this.icon,
    required this.action,
    this.isLinked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: (isLinked)
            ? Border.all(color: blackColor, width: 1.2)
            : Border.all(color: const Color(0xFFE0E0E0), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              const SizedBox(width: 20),
              content,
            ],
          ),
          action,
        ],
      ),
    );
  }
}
