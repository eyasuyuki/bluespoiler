// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      id: json['id'] as String,
      password: json['password'] as String,
      body: json['body'] as String,
      alt: json['alt'] as String,
      image: const Uint8ListConverter().fromJson(json['image'] as List<int>?),
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'body': instance.body,
      'alt': instance.alt,
      'image': const Uint8ListConverter().toJson(instance.image),
    };
