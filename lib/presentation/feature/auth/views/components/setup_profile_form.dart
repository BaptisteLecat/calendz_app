import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:calendz_app/constants/constants.dart';

class SetupProfileForm extends StatelessWidget {
  const SetupProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Full name",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
                child: SvgPicture.asset(
                  "assets/icons/Profile.svg",
                  height: 24,
                  width: 24,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Date of birth",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding * 0.75),
                  child: SvgPicture.asset(
                    "assets/icons/Calender.svg",
                    height: 24,
                    width: 24,
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Phone number",
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: defaultPadding),
                child: SizedBox(
                  width: 72,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Call.svg",
                        height: 24,
                        width: 24,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.3),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        child: Text(
                          "+1",
                          style:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          thickness: 1,
                          width: defaultPadding / 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
