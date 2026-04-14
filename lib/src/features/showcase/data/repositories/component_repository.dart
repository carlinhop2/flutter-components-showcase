import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/utils/result_extensions.dart';
import '../../domain/models/component_item.dart';

abstract interface class ComponentRepository {
  Result<List<ComponentItem>> getComponents();
}

final class InMemoryComponentRepository implements ComponentRepository {
  const InMemoryComponentRepository();

  @override
  Result<List<ComponentItem>> getComponents() => Right(_components);

  static const List<ComponentItem> _components = [
    ComponentItem(
      id: 'buttons',
      title: 'Buttons',
      description:
          'ElevatedButton, FilledButton, OutlinedButton, TextButton, IconButton, FAB, SegmentedButton',
      route: '/buttons',
      icon: Icons.smart_button_outlined,
    ),
    ComponentItem(
      id: 'text_fields',
      title: 'Text Fields',
      description:
          'TextField variants, decoration, validation, password, multiline',
      route: '/text-fields',
      icon: Icons.text_fields,
    ),
    ComponentItem(
      id: 'cards',
      title: 'Cards & Lists',
      description:
          'Card, filled Card, outlined Card, ListTile, ExpansionTile',
      route: '/cards',
      icon: Icons.credit_card,
    ),
    ComponentItem(
      id: 'dialogs',
      title: 'Dialogs & Sheets',
      description: 'AlertDialog, ModalBottomSheet, SnackBar',
      route: '/dialogs',
      icon: Icons.chat_bubble_outline,
    ),
    ComponentItem(
      id: 'navigation',
      title: 'Navigation',
      description: 'NavigationBar, NavigationRail, TabBar',
      route: '/navigation',
      icon: Icons.navigation_outlined,
    ),
    ComponentItem(
      id: 'forms',
      title: 'Forms',
      description:
          'Checkbox, Switch, Slider, DropdownMenu, DatePicker',
      route: '/forms',
      icon: Icons.dynamic_form_outlined,
    ),
    ComponentItem(
      id: 'animations',
      title: 'Animations',
      description:
          'AnimatedContainer, AnimatedOpacity, Hero, bounce, rotation',
      route: '/animations',
      icon: Icons.animation,
    ),
    ComponentItem(
      id: 'typography',
      title: 'Typography',
      description:
          'All 15 Material 3 text styles with Google Fonts (Inter)',
      route: '/typography',
      icon: Icons.text_snippet_outlined,
    ),
    ComponentItem(
      id: 'colors',
      title: 'Colors & Theming',
      description:
          'Full ColorScheme palette with live light/dark toggle',
      route: '/colors',
      icon: Icons.palette_outlined,
    ),
  ];
}
