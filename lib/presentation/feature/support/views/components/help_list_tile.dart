import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpListTile extends StatelessWidget {
  const HelpListTile({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.subtitle,
    required this.press,
  }) : super(key: key);

  final String svgSrc, title, subtitle;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: CircleAvatar(
        radius: 28,
        backgroundColor:
            Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.05),
        child: SvgPicture.asset(
          svgSrc,
          height: 24,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 16 / 4),
        child: Text(subtitle),
      ),
    );
  }
}
