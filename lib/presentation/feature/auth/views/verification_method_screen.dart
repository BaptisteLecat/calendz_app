import 'package:flutter/material.dart';
import 'package:calendz_app/constants/constants.dart';

import 'components/verification_method_card.dart';

class VerificationMethodScreen extends StatelessWidget {
  const VerificationMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.light
                      ? "assets/Illustration/Password.png"
                      : "assets/Illustration/Password_dark.png",
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
              const Spacer(),
              Text(
                "Choose verification method",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                  "We’ll send you a verification code to reset your password"),
              const Spacer(),
              VerificationMethodCard(
                text: "+19******1233",
                svgSrc: "assets/icons/Call.svg",
                isActive: true,
                press: () {},
              ),
              const SizedBox(height: defaultPadding),
              VerificationMethodCard(
                text: "abu*******@gmail.com",
                svgSrc: "assets/icons/Message.svg",
                isActive: false,
                press: () {},
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
