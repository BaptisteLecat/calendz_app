import 'package:flutter/material.dart';
import 'package:calendz_app/constants/constants.dart';

class DoneResetPasswordScreen extends StatelessWidget {
  const DoneResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                Theme.of(context).brightness == Brightness.light
                    ? "assets/Illustration/Password.png"
                    : "assets/Illustration/Password_dark.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Spacer(),
              Text(
                "Your password has been changed successfully!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Log in"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
