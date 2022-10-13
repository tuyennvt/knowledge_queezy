// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return _CategoryResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryResponse {
  @JsonKey(name: "trivia_categories")
  List<CategoryModel> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) then) =
      _$CategoryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "trivia_categories") List<CategoryModel> categories});
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._value, this._then);

  final CategoryResponse _value;
  // ignore: unused_field
  final $Res Function(CategoryResponse) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryResponseCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$$_CategoryResponseCopyWith(
          _$_CategoryResponse value, $Res Function(_$_CategoryResponse) then) =
      __$$_CategoryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "trivia_categories") List<CategoryModel> categories});
}

/// @nodoc
class __$$_CategoryResponseCopyWithImpl<$Res>
    extends _$CategoryResponseCopyWithImpl<$Res>
    implements _$$_CategoryResponseCopyWith<$Res> {
  __$$_CategoryResponseCopyWithImpl(
      _$_CategoryResponse _value, $Res Function(_$_CategoryResponse) _then)
      : super(_value, (v) => _then(v as _$_CategoryResponse));

  @override
  _$_CategoryResponse get _value => super._value as _$_CategoryResponse;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_CategoryResponse(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_CategoryResponse
    with DiagnosticableTreeMixin
    implements _CategoryResponse {
  const _$_CategoryResponse(
      {@JsonKey(name: "trivia_categories")
          required final List<CategoryModel> categories})
      : _categories = categories;

  factory _$_CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryResponseFromJson(json);

  final List<CategoryModel> _categories;
  @override
  @JsonKey(name: "trivia_categories")
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CategoryResponse(categories: $categories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CategoryResponse'))
      ..add(DiagnosticsProperty('categories', categories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryResponse &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryResponseCopyWith<_$_CategoryResponse> get copyWith =>
      __$$_CategoryResponseCopyWithImpl<_$_CategoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryResponseToJson(
      this,
    );
  }
}

abstract class _CategoryResponse implements CategoryResponse {
  const factory _CategoryResponse(
      {@JsonKey(name: "trivia_categories")
          required final List<CategoryModel> categories}) = _$_CategoryResponse;

  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =
      _$_CategoryResponse.fromJson;

  @override
  @JsonKey(name: "trivia_categories")
  List<CategoryModel> get categories;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryResponseCopyWith<_$_CategoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
