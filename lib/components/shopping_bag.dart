import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class ShoppingBag extends StatelessWidget {
  const ShoppingBag({
    Key? key,
    this.color,
    this.numOfItem,
  }) : super(key: key);

  final Color? color;
  final int? numOfItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            numOfItem == null
                ? "assets/icons/Bag.svg"
                : "assets/icons/bag_full.svg",
            height: 24,
            width: 24,
            color: color ?? Theme.of(context).iconTheme.color,
          ),
          if (numOfItem != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                numOfItem!.toString(),
                style: TextStyle(
                  fontFamily: grandisExtendedFont,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? blackColor
                      : Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
