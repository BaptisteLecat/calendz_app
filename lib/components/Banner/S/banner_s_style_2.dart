import 'package:flutter/material.dart';
import 'package:calendz_app/components/Banner/S/banner_s.dart';
import 'package:calendz_app/constants/constants.dart';

class BannerSStyle2 extends StatelessWidget {
  const BannerSStyle2(
      {Key? key,
      this.image = "https://i.imgur.com/taodfci.png",
      required this.title,
      this.subttile,
      this.bottomText,
      required this.press})
      : super(key: key);

  final String image, title;
  final String? subttile, bottomText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image,
      press: press,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (subttile != null)
                Text(
                  subttile!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: grandisExtendedFont,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (subttile != null) const SizedBox(height: defaultPadding / 4),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontFamily: grandisExtendedFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              if (bottomText != null)
                const SizedBox(height: defaultPadding / 4),
              if (bottomText != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2,
                      vertical: defaultPadding / 4),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadious * 2)),
                  ),
                  child: Text(
                    bottomText!.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black54,
                      fontFamily: grandisExtendedFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
