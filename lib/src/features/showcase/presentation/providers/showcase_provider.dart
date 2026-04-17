import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/component_repository.dart';
import '../../domain/models/component_item.dart';
import '../../../../core/utils/result_extensions.dart';

part 'showcase_provider.g.dart';

@riverpod
ComponentRepository componentRepository(Ref ref) =>
    const InMemoryComponentRepository();

@riverpod
Result<List<ComponentItem>> componentItems(Ref ref) =>
    ref.watch(componentRepositoryProvider).getComponents();
