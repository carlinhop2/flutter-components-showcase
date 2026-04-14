import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/showcase_provider.dart';

class ShowcaseDrawer extends ConsumerWidget {
  const ShowcaseDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsResult = ref.watch(componentItemsProvider);
    final cs = Theme.of(context).colorScheme;

    return NavigationDrawer(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: cs.primaryContainer),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.widgets_outlined, size: 48, color: cs.onPrimaryContainer),
              const SizedBox(height: 8),
              Text(
                'Components',
                style: TextStyle(
                  color: cs.onPrimaryContainer,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
            context.go('/');
          },
        ),
        const Divider(),
        ...itemsResult.fold(
          (_) => [const ListTile(title: Text('Failed to load'))],
          (items) => items.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                Navigator.of(context).pop();
                context.go(item.route);
              },
            ),
          ),
        ),
      ],
    );
  }
}
