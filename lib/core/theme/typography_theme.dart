import 'package:flutter/material.dart';

TextTheme textThemeDark(TextTheme base) {
  return base
  .copyWith(
    headline1: base.headline1!.copyWith(
      fontSize: 34.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    headline2: base.headline2!.copyWith(
      fontSize: 27.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    headline3: base.headline3!.copyWith(
      fontSize: 20.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    headline4: base.headline4!.copyWith(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontSize: 15.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    button: base.button!.copyWith(
      fontSize: 13.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
    caption: base.caption!.copyWith(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
    overline: base.overline!.copyWith(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
  )
  .apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
  );
}

TextTheme textThemeLight(TextTheme base) {
  return base
  .copyWith(
    headline1: base.headline1!.copyWith(
      fontSize: 34.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    headline2: base.headline2!.copyWith(
      fontSize: 27.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    headline3: base.headline3!.copyWith(
      fontSize: 20.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    headline4: base.headline4!.copyWith(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    subtitle1: base.subtitle1!.copyWith(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    bodyText1: base.bodyText1!.copyWith(
      fontSize: 15.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    button: base.button!.copyWith(
      fontSize: 13.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
    caption: base.caption!.copyWith(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
    overline: base.overline!.copyWith(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w200,
    ),
  )
  .apply(
    displayColor: Colors.black,
    bodyColor: Colors.black,
  );
}

extension CustomTextTheme on TextTheme {
  TextStyle get mentalLargeTitle {
    return const TextStyle(
      fontSize: 34.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalTitle {
    return const TextStyle(
      fontSize: 27.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalTitle2 {
    return const TextStyle(
      fontSize: 20.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalTitle3 {
    return const TextStyle(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalHeadline {
    return const TextStyle(
      fontSize: 17.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalBody {
    return const TextStyle(
      fontSize: 15.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalCaption {
    return const TextStyle(
      fontSize: 13.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalCaption2 {
    return const TextStyle(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }

  TextStyle get mentalTab {
    return const TextStyle(
      fontSize: 11.0,
      height: 1.2,
      fontFamily: 'Inter',
    );
  }
}