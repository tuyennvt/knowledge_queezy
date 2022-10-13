import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedPrefsProvider = Provider<SharedPrefs>((ref) {
  return SharedPrefs(ref.watch(sharedPreferencesProvider));
});

class SharedPrefs {
  final SharedPreferences sharedPreferences;

  SharedPrefs(this.sharedPreferences);

  Future<void> setScore(int value) async {
    await sharedPreferences.setInt("score", value);
  }

  Future<int> getScore() async {
    int? value = sharedPreferences.getInt("score");
    return value ?? 0;
  }

  Future<void> setCoin(int value) async {
    await sharedPreferences.setInt("coin", value);
  }

  Future<int> getCoin() async {
    int? value = sharedPreferences.getInt("coin");
    return value ?? 100;
  }
}
