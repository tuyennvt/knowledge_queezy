import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/src/data/local/shared_prefs.dart';

final scoreProvider = FutureProvider<int>((ref) async {
  return ref.watch(sharedPrefsProvider).getScore();
});

final coinProvider = FutureProvider<int>((ref) async {
  return ref.watch(sharedPrefsProvider).getCoin();
});
