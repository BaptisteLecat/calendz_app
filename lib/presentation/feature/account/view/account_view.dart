import 'package:calendz_app/constants/constants.dart';
import 'package:calendz_app/presentation/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return ListView(
            children: [
              const SizedBox(height: 20),
              SocialAccountWidget(
                  isLinked: state.authUser != null &&
                      state.authUser!.googleProfile != null,
                  content: Text(
                      (state.authUser != null &&
                              state.authUser!.googleProfile != null)
                          ? "${state.authUser!.googleProfile!.email}"
                          : "Se connecter avec Google",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: (state.authUser != null &&
                                  state.authUser!.googleProfile != null)
                              ? null
                              : Color.fromARGB(255, 182, 182, 182))),
                  icon: SvgPicture.asset(
                    "assets/svg/google.svg",
                    height: 26,
                    color: (state.authUser != null &&
                            state.authUser!.googleProfile != null)
                        ? null
                        : blackColor,
                  ),
                  action: (state.authUser != null &&
                          state.authUser!.googleProfile != null)
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            size: 28,
                          ),
                          color: const Color(0xFFE57373),
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.add5,
                            size: 28,
                          ),
                          color: Theme.of(context).iconTheme.color,
                        )),
              SocialAccountWidget(
                  isLinked: state.authUser != null &&
                      state.authUser!.appleProfile != null,
                  content: Text(
                      (state.authUser != null &&
                              state.authUser!.appleProfile != null)
                          //Display the email with "..." at the end if it's too long.
                          ? "${state.authUser!.appleProfile!.email!.length > 30 ? state.authUser!.appleProfile!.email!.substring(0, 30) + "..." : state.authUser!.appleProfile!.email}"
                          : "Se connecter avec Apple",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: (state.authUser != null &&
                                  state.authUser!.appleProfile != null)
                              ? null
                              : Color.fromARGB(255, 182, 182, 182))),
                  icon: SvgPicture.asset(
                    "assets/svg/apple.svg",
                    height: 26,
                    color: (state.authUser != null &&
                            state.authUser!.appleProfile != null)
                        ? null
                        : blackColor,
                  ),
                  action: (state.authUser != null &&
                          state.authUser!.appleProfile != null)
                      ? IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            size: 28,
                          ),
                          color: const Color(0xFFE57373),
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.add5,
                            size: 28,
                          ),
                          color: Theme.of(context).iconTheme.color,
                        )),
            ],
          );
        },
      ),
    );
  }
}

class SocialAccountWidget extends StatelessWidget {
  final Widget content;
  final Widget icon;
  final Widget action;
  final bool isLinked;
  const SocialAccountWidget({
    Key? key,
    required this.content,
    required this.icon,
    required this.action,
    this.isLinked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: (isLinked)
            ? Border.all(color: blackColor, width: 1.2)
            : Border.all(color: const Color(0xFFE0E0E0), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              const SizedBox(width: 20),
              content,
            ],
          ),
          action,
        ],
      ),
    );
  }
}
