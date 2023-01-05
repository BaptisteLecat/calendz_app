import 'package:calendz_app/components/chat_active_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/help_list_tile.dart';

class GetHelpScreen extends StatelessWidget {
  const GetHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Help"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Share.svg",
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? "assets/Illustration/Help_darkTheme.png"
                : "assets/Illustration/Help_lightTheme.png",
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const SizedBox(height: 16 * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "We are here to help so please get in touch with us.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Spacer(),
          HelpListTile(
            svgSrc: "assets/icons/Call.svg",
            title: "Phone Number",
            subtitle: "+1-202-555-0162",
            press: () {},
          ),
          const Divider(),
          HelpListTile(
            svgSrc: "assets/icons/Message.svg",
            title: "E-mail address",
            subtitle: "theflutterway@gmail.com",
            press: () {},
          ),
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black45
                      : Colors.black12,
                  blurRadius: 108,
                ),
              ],
            ),
            child: SafeArea(
              child: ListTile(
                onTap: () {
                  //Navigator.pushNamed(context, chatScreenRoute);
                },
                title: const Text(
                  "Contact live chat",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: const Text("we are ready to answer you."),
                trailing: SvgPicture.asset(
                  "assets/icons/miniRight.svg",
                  color: Theme.of(context).iconTheme.color!.withOpacity(0.4),
                ),
                leading: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Chat.svg",
                      ),
                    ),
                    const Positioned(
                      right: -4,
                      top: -4,
                      child: ChatActiveDot(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
