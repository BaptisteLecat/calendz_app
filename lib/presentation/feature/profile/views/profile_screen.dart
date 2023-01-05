import 'package:calendz_app/components/list_tile/divider_list_tile.dart';
import 'package:calendz_app/presentation/app/app_route.dart';
import 'package:calendz_app/presentation/app/bloc/app_bloc.dart';
import 'package:calendz_app/presentation/app/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(" Mon profil",
                  style: Theme.of(context).textTheme.headline4!)),
        ),
        body: ListView(
          children: [
            /*BlocBuilder<AppBloc, AppState>(
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
                  subtitle: Text("1230 points d'habitude",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600)),
                  press: () {
                    context.push(AppRoute.userInfo.path);
                  },
                );
              },
            ),*/
            /*Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 2),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(color: const Color(0xFFF3F3F4)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                            child: Text(
                          "Partager",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Theme.of(context).primaryColor),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 16 * 2),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                            child: Text(
                          "Suggestion",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Paramètres",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 16 / 2),
            ProfileMenuListTile(
              text: Text(
                "Comptes associés",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              svgSrc: "assets/icons/Profile.svg",
              press: () {
                context.push(AppRoute.associatedAccounts.path);
              },
            ),
            DividerListTileWithTrilingText(
              svgSrc: "assets/icons/Notification.svg",
              title: Text(
                "Notification",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trilingText: "Off",
              press: () {
                context.push(AppRoute.enableNotification.path);
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16 / 2),
              child: Text(
                "Aides et Support",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            ProfileMenuListTile(
              text: Text(
                "Nous contacter",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              svgSrc: "assets/icons/Help.svg",
              press: () {
                context.push(AppRoute.getHelp.path);
              },
            ),
            ProfileMenuListTile(
              text: Text(
                "FAQ & Aides",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              svgSrc: "assets/icons/FAQ.svg",
              press: () {},
              isShowDivider: false,
            ),
            const SizedBox(height: 16),

            // Log Out
            ListTile(
              onTap: () {
                context.read<AuthBloc>().add(LogOutRequested());
              },
              minLeadingWidth: 24,
              leading: SvgPicture.asset(
                "assets/icons/Logout.svg",
                height: 24,
                width: 24,
                color: const Color(0xFFE74C3C),
              ),
              title: Text(
                "Se déconnecter",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: const Color(0xFFE74C3C),
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
