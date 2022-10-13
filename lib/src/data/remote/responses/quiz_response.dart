import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:knowledge_queezy/src/models/quiz_model.dart';

part 'quiz_response.freezed.dart';
part 'quiz_response.g.dart';

@freezed
class QuizResponse with _$QuizResponse {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory QuizResponse({
    @JsonKey(name: "response_code") required int responseCode,
    required List<QuizModel> results,
  }) = _QuizResponse;

  factory QuizResponse.fromJson(Map<String, dynamic> json) => _$QuizResponseFromJson(json);
}
