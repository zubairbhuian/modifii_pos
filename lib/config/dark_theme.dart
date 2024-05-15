import 'package:flutter/material.dart';
import 'package:flutter_base/config/fonts.dart';

ThemeData darkTheme = ThemeData(
    // ***** Color *****
    primaryColor: const Color(0xffFF7A59),
    primaryColorDark: const Color(0xff0C1C2C),
    primaryColorLight: const Color(0xff0C93AB),
    canvasColor: const Color(0x000000ff),
    cardColor: const Color(0xffF9FAFD),
    disabledColor: const Color(0xffC4CACF),
    dividerColor: const Color(0xff5B636B),
    dialogBackgroundColor: const Color(0xffF9FAFD),
    hintColor: const Color(0xffA0A3A9),
    focusColor: const Color(0x000000ff),
    highlightColor: const Color(0x000000ff),
    indicatorColor: const Color(0x000000ff),
    shadowColor: const Color(0x000000ff),
    splashColor: const Color(0xffFF7A59),
    scaffoldBackgroundColor: const Color(0xffFFFFFF),
    secondaryHeaderColor: null,
    hoverColor: const Color(0x000000ff),
    unselectedWidgetColor: const Color(0xffEEEEEE),
    
    colorScheme: const ColorScheme.dark(
      error: Color(0xffE7474B)
    ),

    // *****  Others Color *****
    // primarySwatch: MyFunc.createMaterialColor(const Color(0xff8A0051)),
    // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
    //     .copyWith(background: const Color(0xffFFFFFF)),

    // *****  brightness *****
    // ****** Font Family ******
    fontFamily: Fonts.primary,
    // ****** Card Theme ******
    cardTheme: CardTheme(
        color: const Color(0xffF9FAFD),
        shadowColor: Colors.black,
        surfaceTintColor: null,
        margin: null,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Adjust the radius as needed
        ),
        elevation: 1),
    // ****** Text Theme ******
    textTheme: const TextTheme(
      //******  Label  ******
      labelLarge: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff010101)),
      labelMedium: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff010101)),
      labelSmall: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xff010101)),

      //******  Body  ******
      bodyLarge: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xff666666)),
      bodyMedium: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xff666666)),
      //******  Title  ******
      titleLarge: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      titleMedium: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      titleSmall: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      //******  HeadLine  ******
      headlineLarge: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 36,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      headlineMedium: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      headlineSmall: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Color(0xff0C1C2C)),
      //******  Display  ******
      displayLarge: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 36,
          fontWeight: FontWeight.w700,
          color: Color(0xff0C1C2C)),
      displayMedium: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Color(0xff0C1C2C)),
      displaySmall: TextStyle(
          fontFamily: Fonts.primary,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xff0C1C2C)),
    ));
