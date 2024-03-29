// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostResult _$PostResultFromJson(Map<String, dynamic> json) {
  return _PostResult.fromJson(json);
}

/// @nodoc
mixin _$PostResult {
  String get url => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostResultCopyWith<PostResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostResultCopyWith<$Res> {
  factory $PostResultCopyWith(
          PostResult value, $Res Function(PostResult) then) =
      _$PostResultCopyWithImpl<$Res, PostResult>;
  @useResult
  $Res call({String url, String status});
}

/// @nodoc
class _$PostResultCopyWithImpl<$Res, $Val extends PostResult>
    implements $PostResultCopyWith<$Res> {
  _$PostResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostResultImplCopyWith<$Res>
    implements $PostResultCopyWith<$Res> {
  factory _$$PostResultImplCopyWith(
          _$PostResultImpl value, $Res Function(_$PostResultImpl) then) =
      __$$PostResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String status});
}

/// @nodoc
class __$$PostResultImplCopyWithImpl<$Res>
    extends _$PostResultCopyWithImpl<$Res, _$PostResultImpl>
    implements _$$PostResultImplCopyWith<$Res> {
  __$$PostResultImplCopyWithImpl(
      _$PostResultImpl _value, $Res Function(_$PostResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? status = null,
  }) {
    return _then(_$PostResultImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostResultImpl implements _PostResult {
  const _$PostResultImpl({required this.url, required this.status});

  factory _$PostResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostResultImplFromJson(json);

  @override
  final String url;
  @override
  final String status;

  @override
  String toString() {
    return 'PostResult(url: $url, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostResultImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostResultImplCopyWith<_$PostResultImpl> get copyWith =>
      __$$PostResultImplCopyWithImpl<_$PostResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostResultImplToJson(
      this,
    );
  }
}

abstract class _PostResult implements PostResult {
  const factory _PostResult(
      {required final String url,
      required final String status}) = _$PostResultImpl;

  factory _PostResult.fromJson(Map<String, dynamic> json) =
      _$PostResultImpl.fromJson;

  @override
  String get url;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PostResultImplCopyWith<_$PostResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
