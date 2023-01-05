import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/constants.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.last4Digits,
    required this.name,
    required this.expiryDate,
    this.isSelected = false,
    this.press,
    this.bgColor = primaryColor,
  }) : super(key: key);

  final String last4Digits, name, expiryDate;
  final bool isSelected;
  final VoidCallback? press;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(defaultBorderRadious * 2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/card.svg",
                                height: 32,
                                width: 32,
                                color: Colors.white,
                              ),
                              if (isSelected)
                                CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        defaultPadding / 4),
                                    child: SvgPicture.asset(
                                      "assets/icons/Singlecheck.svg",
                                      color: primaryColor,
                                    ),
                                  ),
                                )
                            ],
                          ),
                          const Spacer(),
                          Text(
                            "**** **** **** $last4Digits",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/Card_Pattern.svg",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name),
                                const SizedBox(height: defaultPadding / 4),
                                Text(expiryDate)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isSelected) const SizedBox(height: defaultPadding),
          if (isSelected)
            Form(
              child: TextFormField(
                validator: (value) {},
                onSaved: (cvv) {},
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "CVV",
                  counterText: "",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/CVV.svg",
                      color: Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle!
                          .color,
                    ),
                  ),
                ),
              ),
            ),
          if (isSelected) const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }
}
