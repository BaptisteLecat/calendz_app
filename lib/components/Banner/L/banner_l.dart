import 'package:flutter/material.dart';

import '../../network_image_with_loader.dart';

class BannerL extends StatelessWidget {
  const BannerL(
      {Key? key,
      required this.image,
      required this.press,
      required this.children})
      : super(key: key);

  final String image;
  final VoidCallback press;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            NetworkImageWithLoader(image, radius: 0),
            Container(color: Colors.black45),
            ...children,
          ],
        ),
      ),
    );
  }
}
