import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextFormField(
              initialValue: "Sepide Moqadasi",
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16 * 0.75),
                  child: SvgPicture.asset(
                    "assets/icons/Profile.svg",
                    color: Theme.of(context).iconTheme.color,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                initialValue: "theflutterway@gmail.com",
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16 * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/Message.svg",
                      color: Theme.of(context).iconTheme.color,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),
            TextFormField(
              initialValue: "01/3/1999",
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16 * 0.75),
                  child: SvgPicture.asset(
                    "assets/icons/Calender.svg",
                    color: Theme.of(context).iconTheme.color,
                    height: 24,
                    width: 24,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextFormField(
                initialValue: "+1-202-555-0162",
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 72,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Call.svg",
                            height: 24,
                            width: 24,
                            color:
                                Theme.of(context).textTheme.bodyText1!.color!,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16 / 2),
                            child: Text("+1",
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          const SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              thickness: 1,
                              width: 16 / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
