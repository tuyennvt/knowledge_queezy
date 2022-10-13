import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required AsyncValue<List<CategoryModel>> categories,
    required CategoryModel? categorySelected,
    required String? difficulty,
  }) = _MainState;
}
