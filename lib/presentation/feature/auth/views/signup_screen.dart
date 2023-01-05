import 'package:calendz_app/presentation/feature/auth/widget/secondary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _termsLicence = false;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "C'est parti!",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    "Une nouvelle aventure commence pour toi! Il te suffit de t’inscrire y participer.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: defaultPadding),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _firstnameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Prénom",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding * 0.75),
                              child: SvgPicture.asset(
                                "assets/icons/user.svg",
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
                          controller: _emailController,
                          validator: emaildValidator,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Adresse email",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding * 0.75),
                              child: SvgPicture.asset(
                                "assets/icons/Message.svg",
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
                          controller: _passwordController,
                          validator: passwordValidator,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Mot de passe",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding * 0.75),
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
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _termsLicence = value!;
                          });
                        },
                        value: _termsLicence,
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "J'accepte les",
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push(AppRoute.termsOfServices.path);
                                  },
                                text: " Conditions générales d'utilisations ",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const TextSpan(
                                text: "et la politique de confidentialité.",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      // Validate Form
                      if (_formKey.currentState!.validate()) {
                        if (_termsLicence) {
                          context.read<AuthBloc>().add(RegisterRequested(
                                _emailController.value.text,
                                _passwordController.value.text,
                                _firstnameController.value.text,
                              ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            content: const Text(
                                "Tu dois accepter les conditions générales d'utilisations."),
                            duration: const Duration(seconds: 2),
                          ));
                        }
                      }
                    },
                    child: Text("S'inscrire",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).scaffoldBackgroundColor)),
                  ),
                  const SizedBox(height: defaultPadding),
                  SecondaryButton(
                      isSubmitable: true,
                      content: Stack(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: SizedBox(
                                height: 28,
                                width: 28,
                                child: SvgPicture.asset(
                                  "assets/svg/google.svg",
                                ),
                              ),
                            )),
                        Center(
                            child: Text("Connexion avec Google",
                                style: Theme.of(context).textTheme.headline6)),
                      ]),
                      onSubmit: () {
                        context.read<AuthBloc>().add(GoogleSignInRequested());
                      }),
                  const SizedBox(height: defaultPadding),
                  SecondaryButton(
                      isSubmitable: true,
                      content: Stack(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: SizedBox(
                                height: 28,
                                width: 28,
                                child: SvgPicture.asset(
                                  "assets/svg/apple.svg",
                                ),
                              ),
                            )),
                        Center(
                            child: Text("Connexion avec Apple",
                                style: Theme.of(context).textTheme.headline6)),
                      ]),
                      onSubmit: () {
                        context.read<AuthBloc>().add(AppleSignInRequested());
                      })
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tu as déjà un compte?",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextButton(
                  onPressed: () {
                    context.go(AppRoute.login.path);
                  },
                  child: Text(
                    "Connectes-toi",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
