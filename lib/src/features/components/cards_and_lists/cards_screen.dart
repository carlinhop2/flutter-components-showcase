import 'package:flutter/material.dart';
import '../../../core/theme/theme_selector_action.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards & Lists'),
        actions: const [ThemeSelectorAction()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Elevated Card', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elevated Card', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  const Text('This is the default card with elevation shadow.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Filled Card', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card.filled(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filled Card', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  const Text('This is a filled card with a surface-variant tint.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Outlined Card', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Outlined Card', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  const Text('This is an outlined card with a visible border.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('List Tiles', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ...List.generate(
            5,
            (i) => ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text('List item ${i + 1}'),
              subtitle: const Text('Supporting text'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          const SizedBox(height: 16),
          Text('Expansion Tile', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          const ExpansionTile(
            title: Text('Expandable section'),
            subtitle: Text('Tap to expand'),
            children: [
              ListTile(title: Text('Item A')),
              ListTile(title: Text('Item B')),
              ListTile(title: Text('Item C')),
            ],
          ),
        ],
      ),
    );
  }
}
