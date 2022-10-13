// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'play_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayState {
  CategoryModel? get category => throw _privateConstructorUsedError;
  String? get difficulty => throw _privateConstructorUsedError;
  int get life => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  List<QuizModel> get quizzes => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  String get correctAnswer => throw _privateConstructorUsedError;
  String get answerSelected => throw _privateConstructorUsedError;
  PlayStatus get playStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayStateCopyWith<PlayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayStateCopyWith<$Res> {
  factory $PlayStateCopyWith(PlayState value, $Res Function(PlayState) then) =
      _$PlayStateCopyWithImpl<$Res>;
  $Res call(
      {CategoryModel? category,
      String? difficulty,
      int life,
      int score,
      List<QuizModel> quizzes,
      int index,
      String question,
      List<String> answers,
      String correctAnswer,
      String answerSelected,
      PlayStatus playStatus});

  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class _$PlayStateCopyWithImpl<$Res> implements $PlayStateCopyWith<$Res> {
  _$PlayStateCopyWithImpl(this._value, this._then);

  final PlayState _value;
  // ignore: unused_field
  final $Res Function(PlayState) _then;

  @override
  $Res call({
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? life = freezed,
    Object? score = freezed,
    Object? quizzes = freezed,
    Object? index = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? correctAnswer = freezed,
    Object? answerSelected = freezed,
    Object? playStatus = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      life: life == freezed
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      quizzes: quizzes == freezed
          ? _value.quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answerSelected: answerSelected == freezed
          ? _value.answerSelected
          : answerSelected // ignore: cast_nullable_to_non_nullable
              as String,
      playStatus: playStatus == freezed
          ? _value.playStatus
          : playStatus // ignore: cast_nullable_to_non_nullable
              as PlayStatus,
    ));
  }

  @override
  $CategoryModelCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryModelCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$$_PlayStateCopyWith<$Res> implements $PlayStateCopyWith<$Res> {
  factory _$$_PlayStateCopyWith(
          _$_PlayState value, $Res Function(_$_PlayState) then) =
      __$$_PlayStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CategoryModel? category,
      String? difficulty,
      int life,
      int score,
      List<QuizModel> quizzes,
      int index,
      String question,
      List<String> answers,
      String correctAnswer,
      String answerSelected,
      PlayStatus playStatus});

  @override
  $CategoryModelCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_PlayStateCopyWithImpl<$Res> extends _$PlayStateCopyWithImpl<$Res>
    implements _$$_PlayStateCopyWith<$Res> {
  __$$_PlayStateCopyWithImpl(
      _$_PlayState _value, $Res Function(_$_PlayState) _then)
      : super(_value, (v) => _then(v as _$_PlayState));

  @override
  _$_PlayState get _value => super._value as _$_PlayState;

  @override
  $Res call({
    Object? category = freezed,
    Object? difficulty = freezed,
    Object? life = freezed,
    Object? score = freezed,
    Object? quizzes = freezed,
    Object? index = freezed,
    Object? question = freezed,
    Object? answers = freezed,
    Object? correctAnswer = freezed,
    Object? answerSelected = freezed,
    Object? playStatus = freezed,
  }) {
    return _then(_$_PlayState(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      difficulty: difficulty == freezed
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String?,
      life: life == freezed
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      quizzes: quizzes == freezed
          ? _value._quizzes
          : quizzes // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      correctAnswer: correctAnswer == freezed
          ? _value.correctAnswer
          : correctAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      answerSelected: answerSelected == freezed
          ? _value.answerSelected
          : answerSelected // ignore: cast_nullable_to_non_nullable
              as String,
      playStatus: playStatus == freezed
          ? _value.playStatus
          : playStatus // ignore: cast_nullable_to_non_nullable
              as PlayStatus,
    ));
  }
}

/// @nodoc

class _$_PlayState with DiagnosticableTreeMixin implements _PlayState {
  const _$_PlayState(
      {required this.category,
      required this.difficulty,
      required this.life,
      required this.score,
      required final List<QuizModel> quizzes,
      required this.index,
      required this.question,
      required final List<String> answers,
      required this.correctAnswer,
      required this.answerSelected,
      required this.playStatus})
      : _quizzes = quizzes,
        _answers = answers;

  @override
  final CategoryModel? category;
  @override
  final String? difficulty;
  @override
  final int life;
  @override
  final int score;
  final List<QuizModel> _quizzes;
  @override
  List<QuizModel> get quizzes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_quizzes);
  }

  @override
  final int index;
  @override
  final String question;
  final List<String> _answers;
  @override
  List<String> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String correctAnswer;
  @override
  final String answerSelected;
  @override
  final PlayStatus playStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PlayState(category: $category, difficulty: $difficulty, life: $life, score: $score, quizzes: $quizzes, index: $index, question: $question, answers: $answers, correctAnswer: $correctAnswer, answerSelected: $answerSelected, playStatus: $playStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PlayState'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('difficulty', difficulty))
      ..add(DiagnosticsProperty('life', life))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('quizzes', quizzes))
      ..add(DiagnosticsProperty('index', index))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('correctAnswer', correctAnswer))
      ..add(DiagnosticsProperty('answerSelected', answerSelected))
      ..add(DiagnosticsProperty('playStatus', playStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlayState &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.difficulty, difficulty) &&
            const DeepCollectionEquality().equals(other.life, life) &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other._quizzes, _quizzes) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            const DeepCollectionEquality()
                .equals(other.correctAnswer, correctAnswer) &&
            const DeepCollectionEquality()
                .equals(other.answerSelected, answerSelected) &&
            const DeepCollectionEquality()
                .equals(other.playStatus, playStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(difficulty),
      const DeepCollectionEquality().hash(life),
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(_quizzes),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(_answers),
      const DeepCollectionEquality().hash(correctAnswer),
      const DeepCollectionEquality().hash(answerSelected),
      const DeepCollectionEquality().hash(playStatus));

  @JsonKey(ignore: true)
  @override
  _$$_PlayStateCopyWith<_$_PlayState> get copyWith =>
      __$$_PlayStateCopyWithImpl<_$_PlayState>(this, _$identity);
}

abstract class _PlayState implements PlayState {
  const factory _PlayState(
      {required final CategoryModel? category,
      required final String? difficulty,
      required final int life,
      required final int score,
      required final List<QuizModel> quizzes,
      required final int index,
      required final String question,
      required final List<String> answers,
      required final String correctAnswer,
      required final String answerSelected,
      required final PlayStatus playStatus}) = _$_PlayState;

  @override
  CategoryModel? get category;
  @override
  String? get difficulty;
  @override
  int get life;
  @override
  int get score;
  @override
  List<QuizModel> get quizzes;
  @override
  int get index;
  @override
  String get question;
  @override
  List<String> get answers;
  @override
  String get correctAnswer;
  @override
  String get answerSelected;
  @override
  PlayStatus get playStatus;
  @override
  @JsonKey(ignore: true)
  _$$_PlayStateCopyWith<_$_PlayState> get copyWith =>
      throw _privateConstructorUsedError;
}
