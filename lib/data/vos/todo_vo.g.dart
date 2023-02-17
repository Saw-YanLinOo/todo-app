// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoVo _$TodoVoFromJson(Map<String, dynamic> json) => TodoVo(
      id: json['id'] as String?,
      description: json['description'] as String?,
      dateTime: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$TodoVoToJson(TodoVo instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'created_at': instance.dateTime?.toIso8601String(),
    };
