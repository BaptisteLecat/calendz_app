import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../profile/views/components/profile_card.dart';
import 'components/user_info_list_tile.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
        actions: [
          TextButton(
            onPressed: () {
              //Navigator.pushNamed(context, editUserInfoScreenRoute);
            },
            child: const Text("Modifier"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return ProfileCard(
                  name: state.authUser!.lastname ??
                      state.authUser!.firstname ??
                      "Nom inconnu",
                  email: state.authUser!.email ?? "Email inconnu",
                  imageSrc: state.authUser!.avatar ??
                      "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                  // proLableText: "Sliver",
                  // isPro: true, if the user is pro
                  isShowHi: false,
                  isShowArrow: false,
                );
              },
            ),
            const SizedBox(height: 16 * 1.5),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return UserInfoListTile(
                  leadingText: "Nom",
                  trailingText: state.authUser!.lastname ?? "Nom inconnu",
                );
              },
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return UserInfoListTile(
                  leadingText: "Prénom",
                  trailingText: state.authUser!.firstname ?? "Prénom inconnu",
                );
              },
            ),
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return UserInfoListTile(
                  leadingText: "Email",
                  trailingText: state.authUser!.email ?? "Email inconnu",
                );
              },
            ),
            ListTile(
              leading: const Text("Mot de passe"),
              trailing: TextButton(
                onPressed: () {
                  context.push(AppRoute.passwordRecovery.path);
                },
                child: const Text("Modifier"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
