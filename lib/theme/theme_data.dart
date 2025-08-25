import 'package:flutter/material.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';

import 'app_colors.dart';

class AppThemeData {
  static final InputBorder _inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.colorE0E1E2),
    borderRadius: BorderRadius.circular(8),
  );
  static final themeData = ThemeData(
    useMaterial3: true,
    // brightness: Brightness.light,
    datePickerTheme: const DatePickerThemeData(surfaceTintColor: Colors.white),
    fontFamily: 'svn_display',
    splashColor: Colors.transparent,
    primaryColor: AppColors.color812D9E,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.black),
      elevation: 1,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      shadowColor: AppColors.colorGreyF3F3F3,
      backgroundColor: _colorScheme.surface,
      actionsIconTheme: const IconThemeData(color: AppColors.black),
      titleTextStyle: _textTheme.titleLarge!.medium,
    ),
    canvasColor: _colorScheme.surface,
    // indicatorColor: _colorScheme.onPrimary,
    scaffoldBackgroundColor: Colors.white,
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    textTheme: _textTheme,
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.colorPurple5143CD,
      unselectedLabelColor: AppColors.colorGrey808798,
      indicatorColor: _colorScheme.onPrimary,
      indicator: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.colorViolet6A06F6, AppColors.colorBlue1E85FF],
        ),
      ),
      labelStyle: _textTheme.bodyMedium!.semiBold,
      unselectedLabelStyle: _textTheme.bodyMedium!.regular,
    ),
    // input
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 2,
      helperMaxLines: 2,
      // labelStyle: _textTheme.bodyMedium!.regular.textGrey858F9B,
      // floatingLabelStyle: _textTheme.bodyMedium!.regular.textViolet6A06F6,
      hintStyle: _textTheme.bodySmall!.medium.textColor(AppColors.color888E9E),
      // focusedBorder: _focusedBorder,
      border: _inputBorder,
      enabledBorder: _inputBorder,
      errorBorder: _inputBorder.copyWith(borderSide: BorderSide(color: _colorScheme.error)),
      focusedErrorBorder: _inputBorder.copyWith(borderSide: BorderSide(color: _colorScheme.error)),
      disabledBorder: _inputBorder,
      contentPadding: const EdgeInsets.only(left: 20, right: 10),
    ),

    cardTheme: CardThemeData(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
        side: const BorderSide(color: AppColors.colorGreyF5F5F5),
      ),
      margin: EdgeInsets.zero,
      elevation: 0,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.white,
      color: Colors.white,
    ),

    dividerTheme: DividerThemeData(space: 24, color: Colors.grey.shade200, thickness: 1),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
      padding: EdgeInsets.zero,
      disabledColor: Colors.grey.shade400,
    ),

    colorScheme: _colorScheme.copyWith(secondary: AppColors.primary),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return _colorScheme.primary;
        }
        return null;
      }),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return _colorScheme.primary;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return _colorScheme.primary;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return _colorScheme.primary;
        }
        return null;
      }),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w700;

  static const _colorScheme = ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: Colors.white,
    onSurface: AppColors.black,
    error: AppColors.colorRedDA072D,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    brightness: Brightness.light,
    primaryContainer: Colors.white,
    secondaryContainer: Colors.white,
  );

  // static const _colorSchemaDark = ColorScheme.dark(
  //   primary: AppColors.primary,
  //   secondary: AppColors.primary,
  //   surface: Colors.white,
  //   onSurface: AppColors.black,
  //   error: AppColors.colorRedDA072D,
  //   onError: Colors.white,
  //   onPrimary: Colors.white,
  //   onSecondary: Colors.white,
  //   brightness: Brightness.dark,
  //   primaryContainer: Colors.white,
  //   secondaryContainer: Colors.white,
  // );

  static const _textTheme = TextTheme(
    displayMedium: TextStyle(fontWeight: _medium, fontSize: 45.0, height: 52 / 45, color: AppColors.black),
    displaySmall: TextStyle(fontWeight: _regular, fontSize: 36.0, height: 44 / 36, color: AppColors.black),
    headlineLarge: TextStyle(fontWeight: _semiBold, fontSize: 28.0, height: 32.0 / 28.0, color: AppColors.black),
    headlineMedium: TextStyle(fontWeight: _medium, fontSize: 24.0, height: 30.0 / 24.0, color: AppColors.black),
    headlineSmall: TextStyle(fontWeight: _regular, fontSize: 22.0, height: 28.0 / 22.0, color: AppColors.black),
    titleLarge: TextStyle(fontWeight: _semiBold, fontSize: 20.0, height: 26.0 / 20.0, color: AppColors.black),
    titleMedium: TextStyle(fontWeight: _medium, fontSize: 18.0, height: 24.0 / 18.0, color: AppColors.black),
    titleSmall: TextStyle(fontWeight: _regular, fontSize: 16.0, height: 22.0 / 16.0, color: AppColors.black),
    bodyMedium: TextStyle(fontWeight: _medium, fontSize: 14.0, height: 20.0 / 14.0, color: AppColors.black),
    bodyLarge: TextStyle(fontWeight: _semiBold, fontSize: 16.0, height: 22.0 / 16.0, color: AppColors.black),
    labelLarge: TextStyle(fontWeight: _semiBold, fontSize: 13.0, height: 18.0 / 13.0, color: AppColors.black),
    labelMedium: TextStyle(fontWeight: _medium, fontSize: 12.0, height: 18.0 / 12.0, color: AppColors.black),
    bodySmall: TextStyle(fontWeight: _regular, fontSize: 12.0, height: 15.0 / 12.0, color: AppColors.black),
    labelSmall: TextStyle(fontWeight: _medium, fontSize: 10.0, height: 14.0 / 10.0, color: AppColors.black),
  );
}
