import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/showcase/presentation/screens/showcase_screen.dart';
import '../../features/components/buttons/buttons_screen.dart';
import '../../features/components/text_fields/text_fields_screen.dart';
import '../../features/components/cards_and_lists/cards_screen.dart';
import '../../features/components/dialogs_and_sheets/dialogs_screen.dart';
import '../../features/components/navigation/navigation_screen.dart';
import '../../features/components/forms/forms_screen.dart';
import '../../features/components/animations/animations_screen.dart';
import '../../features/components/typography/typography_screen.dart';
import '../../features/components/colors_and_theming/colors_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) => GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => const ShowcaseScreen(),
          routes: [
            GoRoute(path: 'buttons', builder: (_, __) => const ButtonsScreen()),
            GoRoute(path: 'text-fields', builder: (_, __) => const TextFieldsScreen()),
            GoRoute(path: 'cards', builder: (_, __) => const CardsScreen()),
            GoRoute(path: 'dialogs', builder: (_, __) => const DialogsScreen()),
            GoRoute(path: 'navigation', builder: (_, __) => const NavigationScreen()),
            GoRoute(path: 'forms', builder: (_, __) => const FormsScreen()),
            GoRoute(path: 'animations', builder: (_, __) => const AnimationsScreen()),
            GoRoute(path: 'typography', builder: (_, __) => const TypographyScreen()),
            GoRoute(path: 'colors', builder: (_, __) => const ColorsScreen()),
          ],
        ),
      ],
    );
