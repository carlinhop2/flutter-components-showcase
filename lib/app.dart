import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/router/app_router.dart';
import 'src/core/theme/app_theme.dart';
import 'src/core/theme/theme_selection_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeSelection = ref.watch(themeSelectionProvider);

    return MaterialApp.router(
      title: 'Flutter Components Showcase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(preset: themeSelection.preset),
      darkTheme: AppTheme.dark(preset: themeSelection.preset),
      themeMode: themeSelection.mode,
      routerConfig: router,
    );
  }
}
