import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:calendz_app/components/custom_modal_bottom_sheet.dart';
import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/feature/auth/views/components/sign_up_verification_otp_form.dart';

class SignUpVerificationScreen extends StatelessWidget {
  const SignUpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification code",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text("We have sent the code verification to "),
              Row(
                children: [
                  Text(
                    "abuanwar072@gmail.com",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Change your email?"),
                  )
                ],
              ),
              const SignUpVerificationOtpForm(),
              const SizedBox(height: defaultPadding),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: "Resend code after ",
                    children: [
                      TextSpan(
                        text: "1:36",
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Resend"),
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        customModalBottomSheet(
                          context,
                          isDismissible: false,
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Theme.of(context).brightness ==
                                            Brightness.light
                                        ? "assets/Illustration/success.png"
                                        : "assets/Illustration/success_dark.png",
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Whoohooo!",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  const Text(
                                      "Your email has been verified succesfully."),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.go(AppRoute.home.path);
                                    },
                                    child: const Text("Go to shopping"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text("Confirm"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
