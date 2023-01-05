import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:calendz_app/constants/constants.dart';

class NewPassForm extends StatelessWidget {
  const NewPassForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    String pass = "";
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (pass) {
              // Password
            },
            onChanged: (password) => pass = password,
            validator: passwordValidator,
            autofocus: true,
            obscureText: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "New password",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
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
          const SizedBox(height: defaultPadding),
          TextFormField(
            onSaved: (pass) {
              pass = pass;
            },
            validator: (value) =>
                MatchValidator(errorText: "Passwords do not match")
                    .validateMatch(value!, pass),
            obscureText: true,
            decoration: InputDecoration(
              hintText: "New password again",
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
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
        ],
      ),
    );
  }
}
