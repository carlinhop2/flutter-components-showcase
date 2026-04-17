import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_theme.dart';
import 'theme_selection_provider.dart';

class ThemeSelectorAction extends ConsumerWidget {
  const ThemeSelectorAction({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Theme settings',
      icon: const Icon(Icons.palette_outlined),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          showDragHandle: true,
          builder: (_) => const _ThemeSelectorSheet(),
        );
      },
    );
  }
}

class _ThemeSelectorSheet extends ConsumerStatefulWidget {
  const _ThemeSelectorSheet();

  @override
  ConsumerState<_ThemeSelectorSheet> createState() =>
      _ThemeSelectorSheetState();
}

class _ThemeSelectorSheetState extends ConsumerState<_ThemeSelectorSheet> {
  late ThemeMode _selectedMode;
  late ThemePreset _selectedPreset;

  @override
  void initState() {
    super.initState();
    final selection = ref.read(themeSelectionProvider);
    _selectedMode = selection.mode;
    _selectedPreset = selection.preset;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Theme',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          SegmentedButton<ThemeMode>(
            selected: {_selectedMode},
            segments: const [
              ButtonSegment<ThemeMode>(
                value: ThemeMode.light,
                icon: Icon(Icons.light_mode_outlined),
                label: Text('Light'),
              ),
              ButtonSegment<ThemeMode>(
                value: ThemeMode.system,
                icon: Icon(Icons.settings_suggest_outlined),
                label: Text('System'),
              ),
              ButtonSegment<ThemeMode>(
                value: ThemeMode.dark,
                icon: Icon(Icons.dark_mode_outlined),
                label: Text('Dark'),
              ),
            ],
            onSelectionChanged: (s) {
              final mode = s.first;
              setState(() => _selectedMode = mode);
              ref.read(themeSelectionProvider.notifier).setMode(mode);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Color style',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ThemePreset.values
                .map(
                  (preset) => ChoiceChip(
                    label: Text(preset.label),
                    selected: _selectedPreset == preset,
                    onSelected: (_) {
                      setState(() => _selectedPreset = preset);
                      ref.read(themeSelectionProvider.notifier).setPreset(preset);
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
