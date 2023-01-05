import 'package:calendz_app/presentation/feature/auth/widget/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';
import 'package:calendz_app/presentation/app/bloc/user_bloc.dart';

class LoginScreen extends StatefulWidget {
  final bool fromPasswordRecovery;
  const LoginScreen({Key? key, this.fromPasswordRecovery = false})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state.status == UserStatus.passwordReseted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  backgroundColor: const Color(0xFF2ED573),
                ),
              );
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  backgroundColor: const Color(0xFFE74C3C),
                ),
              );
            }
          },
        ),
      ],
      child: Scaffold(
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
                      "Bon retour parmis nous!",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Text(
                      "Prêt.e pour reprendre toutes tes bonnes habitudes ? Nous sommes la pour t’aider !",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(height: defaultPadding),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
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
                    Align(
                      child: TextButton(
                        child: Text(
                          "Mot de passe oublié?",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                        onPressed: () {
                          context.push(AppRoute.passwordRecovery.path);
                        },
                      ),
                    ),
                    SizedBox(
                      height: _size.height > 700
                          ? _size.height * 0.1
                          : defaultPadding,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(SignInRequested(
                              _emailController.value.text,
                              _passwordController.value.text));
                          //context.go(AppRoute.home.path);
                        }
                      },
                      child: Text("Se connecter",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              )),
                    ),
                    const SizedBox(height: defaultPadding),
                    SecondaryButton(
                        isSubmitable: true,
                        content: Stack(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                  style:
                                      Theme.of(context).textTheme.headline6)),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
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
                                  style:
                                      Theme.of(context).textTheme.headline6)),
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
                    "Tu n'as pas de compte?",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppRoute.signup.path);
                    },
                    child: Text(
                      "Incris-toi",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
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
