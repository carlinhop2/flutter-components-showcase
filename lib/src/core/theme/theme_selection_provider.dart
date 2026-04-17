import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

class ThemeSelection {
  const ThemeSelection({
    required this.mode,
    required this.preset,
  });

  final ThemeMode mode;
  final ThemePreset preset;

  ThemeSelection copyWith({
    ThemeMode? mode,
    ThemePreset? preset,
  }) {
    return ThemeSelection(
      mode: mode ?? this.mode,
      preset: preset ?? this.preset,
    );
  }
}

class ThemeSelectionNotifier extends StateNotifier<ThemeSelection> {
  ThemeSelectionNotifier()
      : super(const ThemeSelection(
          mode: ThemeMode.system,
          preset: ThemePreset.indigo,
        )) {
    _restore();
  }

  static const _modeKey = 'theme.mode';
  static const _presetKey = 'theme.preset';

  Future<void> setMode(ThemeMode mode) async {
    if (state.mode == mode) return;
    state = state.copyWith(mode: mode);
    await _save();
  }

  Future<void> setPreset(ThemePreset preset) async {
    if (state.preset == preset) return;
    state = state.copyWith(preset: preset);
    await _save();
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final modeIndex = prefs.getInt(_modeKey);
    final presetIndex = prefs.getInt(_presetKey);

    final mode = (modeIndex != null && modeIndex >= 0 && modeIndex < ThemeMode.values.length)
        ? ThemeMode.values[modeIndex]
        : state.mode;
    final preset =
        (presetIndex != null && presetIndex >= 0 && presetIndex < ThemePreset.values.length)
            ? ThemePreset.values[presetIndex]
            : state.preset;

    state = state.copyWith(mode: mode, preset: preset);
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_modeKey, state.mode.index);
    await prefs.setInt(_presetKey, state.preset.index);
  }
}

final themeSelectionProvider =
    StateNotifierProvider<ThemeSelectionNotifier, ThemeSelection>(
  (_) => ThemeSelectionNotifier(),
);
