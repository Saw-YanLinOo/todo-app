// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoVo _$TodoVoFromJson(Map<String, dynamic> json) => TodoVo(
      id: json['id'] as String?,
      description: json['description'] as String?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$TodoVoToJson(TodoVo instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
