import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';

part 'quiz_model.g.dart';

@freezed
class QuizModel with _$QuizModel {
  const QuizModel._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory QuizModel({
    required String question,
    @JsonKey(name: "correct_answer") required String correctAnswer,
    @JsonKey(name: "incorrect_answers") required List<String> incorrectAnswers,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);

  List<String> getAnswers() {
    List<String> answers = List.from(incorrectAnswers);
    answers.add(correctAnswer);
    answers.shuffle();
    return answers;
  }
}
