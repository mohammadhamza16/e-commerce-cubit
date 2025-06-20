import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class AppStyle {
  // Headline styles
  static TextStyle get headline1 => TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
    letterSpacing: 1.2.sp,
    shadows: [
      Shadow(color: AppColor.shadow, blurRadius: 8.r, offset: Offset(2.w, 4.h)),
    ],
  );
  static TextStyle get headline2 => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.dark,
    letterSpacing: 1.1.sp,
  );
  static TextStyle get productTitlelarge => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
    letterSpacing: 0.8.sp,
  );
  static TextStyle get productTitleMedium => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
    letterSpacing: 0.6.sp,
  );
  static TextStyle get productTitleSmall => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
    letterSpacing: 0.5.sp,
  );
  static TextStyle get productPrice => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.textSecondary,
    letterSpacing: 0.5.sp,
  );
  static TextStyle get productDescription => TextStyle(
    fontSize: 16.sp,
    color: AppColor.textSecondary,
    height: 1.4,
    letterSpacing: 0.5.sp,
  );
  // Subtitle
  static TextStyle get subtitle => TextStyle(
    fontSize: 17.sp,
    color: AppColor.accent,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5.sp,
  );
  static TextStyle get rating => TextStyle(
    fontSize: 16.sp,
    color: AppColor.textPrimary,
    fontWeight: FontWeight.w500,
  );
  // Body text
  static TextStyle get body =>
      TextStyle(fontSize: 16.sp, color: AppColor.textPrimary, height: 1.5);
  static TextStyle get bodySecondary => TextStyle(
    fontSize: 16.sp,
    color: AppColor.textSecondary,
    fontStyle: FontStyle.italic,
    height: 1.5,
  );

  // Button
  static TextStyle get button => TextStyle(
    fontSize: 18.sp,
    color: AppColor.background,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2.sp,
    shadows: [
      Shadow(color: AppColor.shadow, blurRadius: 4.r, offset: Offset(1.w, 2.h)),
    ],
    decoration: TextDecoration.underline,
    decorationColor: AppColor.accent,
    decorationThickness: 1.5.sp,
  );

  // TextField
  static TextStyle get textField =>
      TextStyle(fontSize: 16.sp, color: AppColor.textPrimary);
  static TextStyle get textFieldHint => TextStyle(
    fontSize: 16.sp,
    color: AppColor.textSecondary,
    fontStyle: FontStyle.italic,
  );

  // ThemeData
  static ThemeData get themeData => ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.background,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accent,
      primary: AppColor.primary,
      error: AppColor.error,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primary,
      elevation: 6,
      shadowColor: AppColor.shadow,
      titleTextStyle: headline2,
      iconTheme: IconThemeData(color: AppColor.background),
    ),
    cardTheme: CardTheme(
      color: AppColor.card,
      elevation: 4,
      shadowColor: AppColor.shadow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
    ),
    textTheme: const TextTheme().copyWith(
      headlineSmall: headline1,
      titleMedium: headline2,
      bodyLarge: body,
      bodyMedium: bodySecondary,
      labelLarge: button,
      labelSmall: textFieldHint,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.card,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: AppColor.border, width: 1.2.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: AppColor.border, width: 1.2.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: AppColor.primary, width: 2.2.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: AppColor.error, width: 2.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18.r),
        borderSide: BorderSide(color: AppColor.error, width: 2.2.w),
      ),
      labelStyle: TextStyle(
        color: AppColor.primary,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5.sp,
      ),
      hintStyle: textFieldHint,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.r)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.background,
        textStyle: button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        elevation: 6,
        shadowColor: AppColor.shadow,
      ),
    ),
  );
}
