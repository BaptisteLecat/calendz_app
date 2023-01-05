import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';
import 'package:calendz_app/presentation/app/bloc/user_bloc.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  TextEditingController _emailController = TextEditingController();
  bool isEmailSubmitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state.status == UserStatus.emailNotFound ||
                state.status == UserStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  backgroundColor: const Color(0xFFEA5B5B),
                ),
              );
            }
            if (state.status == UserStatus.passwordReseted) {
              context.go(
                AppRoute.loginFromPasswordRecovery.path,
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "Récupération du mot de passe",
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: defaultPadding / 2),
                Text(
                    "Entre ton adresse e-mail pour récupérer ton mot de passe.",
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: defaultPadding * 2),
                Form(
                  child: TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    onSaved: (emal) {
                      // Email
                    },
                    validator: emaildValidator,
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
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<UserBloc>()
                        .add(UserResetPassword(email: _emailController.text));
                    context.read<AuthBloc>().add(LogOutRequested());
                    setState(() {
                      isEmailSubmitted = true;
                    });
                  },
                  child: const Text("Valider"),
                ),
                const SizedBox(height: defaultPadding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
