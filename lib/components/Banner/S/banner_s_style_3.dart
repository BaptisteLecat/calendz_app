import 'package:flutter/material.dart';
import 'package:calendz_app/components/Banner/S/banner_s.dart';
import 'package:calendz_app/constants/constants.dart';

class BannerSStyle3 extends StatelessWidget {
  const BannerSStyle3({
    Key? key,
    this.image = "https://i.imgur.com/dBrsD0M.png",
    required this.title,
    this.subTitle,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final String? subTitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BannerS(
      image: image,
      press: press,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: grandisExtendedFont,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    if (subTitle != null)
                      const SizedBox(height: defaultPadding / 4),
                    Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: grandisExtendedFont,
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: press,
                child: const Text(
                  "Shop now  >",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
