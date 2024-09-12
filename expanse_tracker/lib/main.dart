import 'package:expanse_tracker/widgets/expanses.dart';
import 'package:flutter/material.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

final theme = ThemeData().copyWith(
    colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.onPrimaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)));

void main() {
  runApp(
    MaterialApp(
      theme: theme,
      home: const Expanses(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
