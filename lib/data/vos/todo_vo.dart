// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'todo_vo.g.dart';

@JsonSerializable()
class TodoVo {
  String? id;
  String? description;

  @JsonKey(name: "created_at")
  DateTime? dateTime;
  TodoVo({
    this.id,
    this.description,
    this.dateTime,
  });

  factory TodoVo.fromJson(Map<String, dynamic> json) => _$TodoVoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoVoToJson(this);

  @override
  String toString() =>
      'TodoVo(id: $id, description: $description, dateTime: $dateTime)';

  @override
  bool operator ==(covariant TodoVo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.description == description &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode => id.hashCode ^ description.hashCode ^ dateTime.hashCode;
}
