import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/src/data/local/shared_prefs.dart';
import 'package:knowledge_queezy/src/data/providers/providers.dart';
import 'package:knowledge_queezy/src/data/remote/http_client.dart';
import 'package:knowledge_queezy/src/models/category_model.dart';
import 'package:knowledge_queezy/src/models/quiz_model.dart';
import 'package:knowledge_queezy/src/modules/play/play_state.dart';

final playProvider = StateNotifierProvider.autoDispose<PlayNotifier, PlayState>((ref) {
  return PlayNotifier(
    ref: ref,
    httpClient: ref.watch(httpClientProvider),
    sharedPrefs: ref.watch(sharedPrefsProvider),
  );
});

class PlayNotifier extends StateNotifier<PlayState> {
  PlayNotifier({required this.ref, required this.httpClient, required this.sharedPrefs})
      : super(
          const PlayState(
            category: null,
            difficulty: null,
            life: 3,
            score: 0,
            quizzes: [],
            index: 0,
            question: '',
            answers: [],
            correctAnswer: '',
            answerSelected: '',
            playStatus: PlayStatus.loading,
          ),
        );

  final AutoDisposeStateNotifierProviderRef ref;
  final HttpClient httpClient;
  final SharedPrefs sharedPrefs;

  Future<void> init({required CategoryModel category, required String difficulty}) async {
    state = state.copyWith(
      playStatus: PlayStatus.loading,
      category: category,
      difficulty: difficulty,
    );
    try {
      List<QuizModel> quizzes =
          await httpClient.getQuizzes(category: category, difficulty: difficulty);

      QuizModel currentQuiz = quizzes[state.index];
      state = state.copyWith(
        quizzes: quizzes,
        question: currentQuiz.question,
        answers: currentQuiz.getAnswers(),
        correctAnswer: currentQuiz.correctAnswer,
        playStatus: PlayStatus.answering,
      );
    } catch (e) {
      state = state.copyWith(playStatus: PlayStatus.loadError);
    }
  }

  Future<void> _onAnswerCorrect() async {
    state = state.copyWith(playStatus: PlayStatus.correct, score: state.score + 1);
    await Future.delayed(const Duration(seconds: 1));
    await nextQuiz();
  }

  Future<void> _onAnswerInCorrect() async {
    state = state.copyWith(playStatus: PlayStatus.inCorrect, life: state.life - 1);
    await Future.delayed(const Duration(seconds: 1));
    if (state.life == 0) {
      state = state.copyWith(playStatus: PlayStatus.gameOver);
      return;
    }
    state = state.copyWith(
      playStatus: PlayStatus.answering,
    );
  }

  void setAnswerSelected(String value) {
    state = state.copyWith(answerSelected: value);
  }

  Future<void> submit() async {
    if (state.playStatus != PlayStatus.answering || state.answerSelected.isEmpty) {
      return;
    }
    if (state.answerSelected == state.correctAnswer) {
      await _onAnswerCorrect();
    } else {
      await _onAnswerInCorrect();
    }
  }

  Future<void> nextQuiz() async {
    int newIndex = state.index + 1;
    if (newIndex < state.quizzes.length - 1) {
      QuizModel currentQuiz = state.quizzes[newIndex];
      state = state.copyWith(
        index: newIndex,
        question: currentQuiz.question,
        answers: currentQuiz.getAnswers(),
        correctAnswer: currentQuiz.correctAnswer,
        answerSelected: '',
        playStatus: PlayStatus.answering,
      );
    } else {
      state = state.copyWith(
        playStatus: PlayStatus.complete,
      );
      int oldScore = await sharedPrefs.getScore();
      await sharedPrefs.setScore(oldScore + state.score);
      ref.refresh(scoreProvider);
    }
  }

  Future<bool> help() async {
    int coin = await sharedPrefs.getCoin();
    if (coin < 10) {
      return false;
    }
    await sharedPrefs.setCoin(coin - 10);
    ref.refresh(coinProvider);
    state = state.copyWith(answerSelected: state.correctAnswer);
    await submit();
    return true;
  }

  int getScore() => state.score;
}
