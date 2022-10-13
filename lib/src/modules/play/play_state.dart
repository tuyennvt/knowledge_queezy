import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/models/quiz_model.dart';

part 'play_state.freezed.dart';

enum PlayStatus {
  loading,
  loadError,
  answering,
  correct,
  inCorrect,
  gameOver,
  complete,
}

@freezed
class PlayState with _$PlayState {
  const factory PlayState({
    required CategoryModel? category,
    required String? difficulty,
    required int life,
    required int score,
    required List<QuizModel> quizzes,
    required int index,
    required String question,
    required List<String> answers,
    required String correctAnswer,
    required String answerSelected,
    required PlayStatus playStatus,
  }) = _PlayState;
}
