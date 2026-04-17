import 'package:flutter/material.dart';
import '../../../core/theme/theme_selector_action.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography'),
        actions: const [ThemeSelectorAction()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _TypeRow(label: 'displayLarge', style: tt.displayLarge, cs: cs),
          _TypeRow(label: 'displayMedium', style: tt.displayMedium, cs: cs),
          _TypeRow(label: 'displaySmall', style: tt.displaySmall, cs: cs),
          const Divider(),
          _TypeRow(label: 'headlineLarge', style: tt.headlineLarge, cs: cs),
          _TypeRow(label: 'headlineMedium', style: tt.headlineMedium, cs: cs),
          _TypeRow(label: 'headlineSmall', style: tt.headlineSmall, cs: cs),
          const Divider(),
          _TypeRow(label: 'titleLarge', style: tt.titleLarge, cs: cs),
          _TypeRow(label: 'titleMedium', style: tt.titleMedium, cs: cs),
          _TypeRow(label: 'titleSmall', style: tt.titleSmall, cs: cs),
          const Divider(),
          _TypeRow(label: 'bodyLarge', style: tt.bodyLarge, cs: cs),
          _TypeRow(label: 'bodyMedium', style: tt.bodyMedium, cs: cs),
          _TypeRow(label: 'bodySmall', style: tt.bodySmall, cs: cs),
          const Divider(),
          _TypeRow(label: 'labelLarge', style: tt.labelLarge, cs: cs),
          _TypeRow(label: 'labelMedium', style: tt.labelMedium, cs: cs),
          _TypeRow(label: 'labelSmall', style: tt.labelSmall, cs: cs),
        ],
      ),
    );
  }
}

class _TypeRow extends StatelessWidget {
  const _TypeRow({
    required this.label,
    required this.style,
    required this.cs,
  });

  final String label;
  final TextStyle? style;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: cs.outline,
                  ),
            ),
          ),
          Expanded(
            child: Text(label, style: style, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
