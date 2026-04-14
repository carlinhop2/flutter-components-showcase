import 'package:flutter/material.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  bool _showDark = false;

  static const List<_ColorRole> _roles = [
    _ColorRole('primary', 'onPrimary'),
    _ColorRole('onPrimary', 'primary'),
    _ColorRole('primaryContainer', 'onPrimaryContainer'),
    _ColorRole('onPrimaryContainer', 'primaryContainer'),
    _ColorRole('secondary', 'onSecondary'),
    _ColorRole('onSecondary', 'secondary'),
    _ColorRole('secondaryContainer', 'onSecondaryContainer'),
    _ColorRole('tertiary', 'onTertiary'),
    _ColorRole('tertiaryContainer', 'onTertiaryContainer'),
    _ColorRole('error', 'onError'),
    _ColorRole('errorContainer', 'onErrorContainer'),
    _ColorRole('surface', 'onSurface'),
    _ColorRole('surfaceContainerHighest', 'onSurfaceVariant'),
    _ColorRole('outline', 'surface'),
  ];

  @override
  Widget build(BuildContext context) {
    final lightScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.light,
    );
    final darkScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF6750A4),
      brightness: Brightness.dark,
    );
    final scheme = _showDark ? darkScheme : lightScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors & Theming'),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.light_mode),
              Switch(
                value: _showDark,
                onChanged: (v) => setState(() => _showDark = v),
              ),
              const Icon(Icons.dark_mode),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: Theme(
        data: ThemeData(
          useMaterial3: true,
          colorScheme: scheme,
        ),
        child: GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: _roles.length,
          itemBuilder: (context, index) {
            final role = _roles[index];
            final bg = role.resolveBackground(scheme);
            final fg = role.resolveForeground(scheme);
            return Container(
              color: bg,
              alignment: Alignment.center,
              child: Text(
                role.name,
                style: TextStyle(
                  color: fg,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ColorRole {
  const _ColorRole(this.name, this.onName);

  final String name;
  final String onName;

  Color resolveBackground(ColorScheme cs) => _resolveColor(name, cs);
  Color resolveForeground(ColorScheme cs) => _resolveColor(onName, cs);

  static Color _resolveColor(String name, ColorScheme cs) {
    switch (name) {
      case 'primary':
        return cs.primary;
      case 'onPrimary':
        return cs.onPrimary;
      case 'primaryContainer':
        return cs.primaryContainer;
      case 'onPrimaryContainer':
        return cs.onPrimaryContainer;
      case 'secondary':
        return cs.secondary;
      case 'onSecondary':
        return cs.onSecondary;
      case 'secondaryContainer':
        return cs.secondaryContainer;
      case 'onSecondaryContainer':
        return cs.onSecondaryContainer;
      case 'tertiary':
        return cs.tertiary;
      case 'onTertiary':
        return cs.onTertiary;
      case 'tertiaryContainer':
        return cs.tertiaryContainer;
      case 'onTertiaryContainer':
        return cs.onTertiaryContainer;
      case 'error':
        return cs.error;
      case 'onError':
        return cs.onError;
      case 'errorContainer':
        return cs.errorContainer;
      case 'onErrorContainer':
        return cs.onErrorContainer;
      case 'surface':
        return cs.surface;
      case 'onSurface':
        return cs.onSurface;
      case 'surfaceContainerHighest':
        return cs.surfaceContainerHighest;
      case 'onSurfaceVariant':
        return cs.onSurfaceVariant;
      case 'outline':
        return cs.outline;
      default:
        return Colors.transparent;
    }
  }
}
