import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_color.dart';

class ButtonStyles {
  static ButtonStyle next = ButtonStyle(
    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    backgroundColor: MaterialStateProperty.all(AppColors.primary)
  );
}