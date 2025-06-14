import 'package:flutter/material.dart';
import 'package:pocetak3/expenses.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.amber);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 175, 104, 10),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) {
    runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kDarkColorScheme.inversePrimary,
          ),
          cardTheme: CardTheme().copyWith(
            color: kDarkColorScheme.inversePrimary,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kDarkColorScheme.onTertiaryContainer,
            ),
            bodyLarge: TextStyle(color: Colors.white),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryFixedVariant,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardTheme().copyWith(
            color: kColorScheme.inversePrimary,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onTertiaryContainer,
            ),
            bodyLarge: TextStyle(color: Colors.black),
          ),
          scaffoldBackgroundColor: kColorScheme.secondaryFixedDim,
        ),
        themeMode: ThemeMode.system,
        home: Expenses(),
      ),
    );
  });
}
