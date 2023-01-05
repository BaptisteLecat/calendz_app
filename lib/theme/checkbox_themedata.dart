import 'package:flutter/material.dart';

import '../constants/constants.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(primaryColor),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(defaultBorderRadious / 2),
    ),
  ),
  side: const BorderSide(color: whileColor40),
);
