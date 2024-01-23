
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_result.freezed.dart';
part 'post_result.g.dart';

@freezed
class PostResult with _$PostResult {
  const factory PostResult({
    required String url,
    required String status,
  }) = _PostResult;

  factory PostResult.fromJson(Map<String, dynamic> json) => _$PostResultFromJson(json);
}
