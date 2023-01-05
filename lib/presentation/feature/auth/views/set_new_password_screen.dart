import 'package:flutter/material.dart';
import 'package:calendz_app/constants/constants.dart';

import 'components/new_pass_form.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set new password",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                  "Your new password must be diffrent from previosly used passwords."),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              NewPassForm(formKey: _key),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {}
                },
                child: const Text("Change Password"),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
