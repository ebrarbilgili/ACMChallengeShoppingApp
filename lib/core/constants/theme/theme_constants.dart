import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeConstants? _instance;
  static ThemeConstants get instance {
    _instance ??= ThemeConstants._init();
    return _instance!;
  }

  ThemeConstants._init();

  ThemeData get themeData => ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        dividerColor: colorScheme.background,
        inputDecorationTheme: inputDecorationTheme,
        tabBarTheme: tabBarTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        appBarTheme: appBarTheme,
      );

  AppBarTheme get appBarTheme {
    return AppBarTheme(
        color: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary));
  }

  ElevatedButtonThemeData get elevatedButtonThemeData {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorScheme.primary),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelColor: colorScheme.onBackground,
      unselectedLabelColor: colorScheme.primary,
      indicator: BubbleTabIndicator(
        indicatorColor: colorScheme.primary,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
        indicatorHeight: 32,
      ),
    );
  }

  InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      border: InputBorder.none,
      hoverColor: colorScheme.onBackground,
    );
  }

  ColorScheme get colorScheme => ColorScheme(
        primary: Color(0xff37396B), //xxx
        primaryVariant: Color(0xff2C5E86),
        secondary: Colors.black, //xxxx
        secondaryVariant: Colors.grey,
        surface: Colors.transparent,
        background: Color(0xffE7E7EB), //xxx
        error: Colors.red,
        onPrimary: Colors.yellow, //xxxx
        onSecondary: Colors.black,
        onSurface: Colors.orange,
        onBackground: Colors.white, //xxx
        onError: Colors.white,
        brightness: Brightness.light,
      );
}
