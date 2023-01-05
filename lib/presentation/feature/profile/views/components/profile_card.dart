import 'package:calendz_app/presentation/app/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.imageSrc,
    this.proLableText = "Pro",
    this.isPro = false,
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
    this.subtitle,
  }) : super(key: key);

  final String name, email, imageSrc;
  final String proLableText;
  final bool isPro, isShowHi, isShowArrow;
  final VoidCallback? press;
  final Text? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: CircleAvatar(
        radius: 38,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: BlocBuilder<UserBloc, UserState>(
          buildWhen: ((previous, current) => current.user != previous.user),
          builder: (context, state) {
            if (state.user != null && state.user.avatar != null) {
              return SvgPicture.string(
                state.user.avatar!,
                fit: BoxFit.contain,
                height: 100,
                width: 100,
              );
            } else {
              return Container(
                color: Colors.white,
              );
            }
          },
        ),
      ),
      title: Row(
        children: [
          Text(
            isShowHi ? "Salut, $name ✋🏻" : name,
            style: const TextStyle(fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 16 / 2),
          if (isPro)
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16 / 2, vertical: 16 / 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                proLableText,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.7,
                  height: 1,
                ),
              ),
            ),
        ],
      ),
      subtitle: subtitle,
      trailing: isShowArrow
          ? SvgPicture.asset(
              "assets/icons/miniRight.svg",
              color: Theme.of(context).iconTheme.color!.withOpacity(0.4),
            )
          : null,
    );
  }
}
