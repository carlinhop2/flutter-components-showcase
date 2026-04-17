import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ThemePreset {
  indigo,
  ocean,
  forest,
  sunset,
  rose,
}

extension ThemePresetX on ThemePreset {
  String get label {
    switch (this) {
      case ThemePreset.indigo:
        return 'Indigo';
      case ThemePreset.ocean:
        return 'Ocean';
      case ThemePreset.forest:
        return 'Forest';
      case ThemePreset.sunset:
        return 'Sunset';
      case ThemePreset.rose:
        return 'Rose';
    }
  }

  Color get seedColor {
    switch (this) {
      case ThemePreset.indigo:
        return const Color(0xFF6750A4);
      case ThemePreset.ocean:
        return const Color(0xFF006C84);
      case ThemePreset.forest:
        return const Color(0xFF3F6E3F);
      case ThemePreset.sunset:
        return const Color(0xFFC24D2C);
      case ThemePreset.rose:
        return const Color(0xFFB83B5E);
    }
  }
}

class AppTheme {
  const AppTheme._();

  static ThemeData light({ThemePreset preset = ThemePreset.indigo}) =>
      _build(Brightness.light, preset);
  static ThemeData dark({ThemePreset preset = ThemePreset.indigo}) =>
      _build(Brightness.dark, preset);

  static ThemeData _build(Brightness brightness, ThemePreset preset) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: preset.seedColor,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: GoogleFonts.interTextTheme(
        ThemeData(brightness: brightness).textTheme,
      ),
    );
  }
}