import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'component_item.freezed.dart';

@freezed
class ComponentItem with _$ComponentItem {
  const factory ComponentItem({
    required String id,
    required String title,
    required String description,
    required String route,
    required IconData icon,
  }) = _ComponentItem;
}
