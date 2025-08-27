import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff100B20);
const MaterialColor kPrimaryyColor = MaterialColor(
  _kPrimaryyColor,
  <int, Color>{
    50: Color(0xff100B20),
    100: Color(0xff100B20),
    200: Color(0xff100B20),
    300: Color(0xff100B20),
    400: Color(0xff100B20),
    500: Color(_kPrimaryyColor),
    600: Color(0xff100B20),
    700: Color(0xff100B20),
    800: Color(0xff100B20),
    900: Color(0xff100B20),
  },
);
const int _kPrimaryyColor = 0xff100B20;

const MaterialColor kPrimaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

const MaterialColor kPrimaryWhite = MaterialColor(
  _whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(_whitePrimaryValue),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int _whitePrimaryValue = 0xFFFFFFFF;

const kShadowOneColorDark = Color(0xff1e1639);
const kShadowTwoColorDark = Color(0xff3b3858);
const kMenuBackgroundColorDark = Color(0xff17112d);

const kShadowOneColorLight = Color(0xffb5b5b5);
const kShadowTwoColorLight = Color(0xffd7d7d7);
const kMenuBackgroundColorLight = Color(0xffe5e5e5);

const kWhiteColor = Color(0xffffffff);
const kBlackColor = Color(0xff000000);
const kGtSectraFine = 'GT Sectra Fine';

const kEnglish = 'en';
const kUnitedState = 'en';
const kArabic = 'ar';
const kEgypt = 'EG';

TextDirection arabicDirection = TextDirection.rtl;    // Todo: عامله عشان اضبط اتجاه الكلام علي حسب الاخبار بتاع كل دوله

Locale currentLocaleApp = const Locale("ar");
