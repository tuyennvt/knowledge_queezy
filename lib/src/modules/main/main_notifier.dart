import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/src/data/remote/http_client.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/modules/main/main_state.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>((ref) {
  return MainNotifier(ref.watch(httpClientProvider));
});

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier(this.httpClient)
      : super(
          const MainState(
            categories: AsyncValue.loading(),
            categorySelected: null,
            difficulty: null,
          ),
        );

  final HttpClient httpClient;

  Future<void> init() async {
    state = state.copyWith(
      categories: await AsyncValue.guard(() => httpClient.getCategories()),
    );
  }

  CategoryModel? getCategorySelected() => state.categorySelected;

  String? getDifficulty() => state.difficulty;

  void setCategorySelected(CategoryModel value) => state = state.copyWith(categorySelected: value);

  void setDifficulty(String value) => state = state.copyWith(difficulty: value);
}
