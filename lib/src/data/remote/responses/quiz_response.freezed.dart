// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizResponse _$QuizResponseFromJson(Map<String, dynamic> json) {
  return _QuizResponse.fromJson(json);
}

/// @nodoc
mixin _$QuizResponse {
  @JsonKey(name: "response_code")
  int get responseCode => throw _privateConstructorUsedError;
  List<QuizModel> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizResponseCopyWith<QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResponseCopyWith<$Res> {
  factory $QuizResponseCopyWith(
          QuizResponse value, $Res Function(QuizResponse) then) =
      _$QuizResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "response_code") int responseCode,
      List<QuizModel> results});
}

/// @nodoc
class _$QuizResponseCopyWithImpl<$Res> implements $QuizResponseCopyWith<$Res> {
  _$QuizResponseCopyWithImpl(this._value, this._then);

  final QuizResponse _value;
  // ignore: unused_field
  final $Res Function(QuizResponse) _then;

  @override
  $Res call({
    Object? responseCode = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_QuizResponseCopyWith<$Res>
    implements $QuizResponseCopyWith<$Res> {
  factory _$$_QuizResponseCopyWith(
          _$_QuizResponse value, $Res Function(_$_QuizResponse) then) =
      __$$_QuizResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "response_code") int responseCode,
      List<QuizModel> results});
}

/// @nodoc
class __$$_QuizResponseCopyWithImpl<$Res>
    extends _$QuizResponseCopyWithImpl<$Res>
    implements _$$_QuizResponseCopyWith<$Res> {
  __$$_QuizResponseCopyWithImpl(
      _$_QuizResponse _value, $Res Function(_$_QuizResponse) _then)
      : super(_value, (v) => _then(v as _$_QuizResponse));

  @override
  _$_QuizResponse get _value => super._value as _$_QuizResponse;

  @override
  $Res call({
    Object? responseCode = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_QuizResponse(
      responseCode: responseCode == freezed
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<QuizModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_QuizResponse with DiagnosticableTreeMixin implements _QuizResponse {
  const _$_QuizResponse(
      {@JsonKey(name: "response_code") required this.responseCode,
      required final List<QuizModel> results})
      : _results = results;

  factory _$_QuizResponse.fromJson(Map<String, dynamic> json) =>
      _$$_QuizResponseFromJson(json);

  @override
  @JsonKey(name: "response_code")
  final int responseCode;
  final List<QuizModel> _results;
  @override
  List<QuizModel> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuizResponse(responseCode: $responseCode, results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuizResponse'))
      ..add(DiagnosticsProperty('responseCode', responseCode))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizResponse &&
            const DeepCollectionEquality()
                .equals(other.responseCode, responseCode) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(responseCode),
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_QuizResponseCopyWith<_$_QuizResponse> get copyWith =>
      __$$_QuizResponseCopyWithImpl<_$_QuizResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizResponseToJson(
      this,
    );
  }
}

abstract class _QuizResponse implements QuizResponse {
  const factory _QuizResponse(
      {@JsonKey(name: "response_code") required final int responseCode,
      required final List<QuizModel> results}) = _$_QuizResponse;

  factory _QuizResponse.fromJson(Map<String, dynamic> json) =
      _$_QuizResponse.fromJson;

  @override
  @JsonKey(name: "response_code")
  int get responseCode;
  @override
  List<QuizModel> get results;
  @override
  @JsonKey(ignore: true)
  _$$_QuizResponseCopyWith<_$_QuizResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
