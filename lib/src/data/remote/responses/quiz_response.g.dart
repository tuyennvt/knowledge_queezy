// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizResponse _$$_QuizResponseFromJson(Map<String, dynamic> json) =>
    _$_QuizResponse(
      responseCode: json['response_code'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => QuizModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuizResponseToJson(_$_QuizResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
