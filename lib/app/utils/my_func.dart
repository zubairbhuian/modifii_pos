import 'package:flutter/material.dart';
import 'package:flutter_base/app/utils/static_colors.dart';

class MyFunc {
 static Color productColor(String text) {
    if (text == "veg") {
      return StaticColors.greenColor;
    } else if (text == "non_veg") {
      return const Color(0xffFD571A);
    } else {
      return StaticColors.purpleColor;
    }
  }

  static MaterialColor createMaterialColor(Color color) {
    List<int> strengths = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];
    Map<int, Color> swatch = <int, Color>{};

    for (int i = 0; i < 10; i++) {
      final int strength = strengths[i];
      final double blend = 1 - (i / 10);
      swatch[strength] = Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        blend,
      );
    }

    return MaterialColor(color.value, swatch);
  }
}
