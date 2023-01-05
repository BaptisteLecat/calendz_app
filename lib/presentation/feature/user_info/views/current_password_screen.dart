import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CurrentPasswordScreen extends StatelessWidget {
  const CurrentPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                "Current Password",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16 / 2),
              const Text("Enter your current password to reset your password"),
              const SizedBox(height: 16 * 2),
              Form(
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  onSaved: (emal) {
                    // Email
                  },
                  validator: emaildValidator,
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16 * 0.75),
                      child: SvgPicture.asset(
                        "assets/icons/Lock.svg",
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
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRoute.passwordRecovery.path);
                },
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
