import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'note.g.dart';

var uuid = const Uuid();

@JsonSerializable()
class Note {
  String id = uuid.v4();
  String title;
  String description;
  String color;

  Note({
    required this.title,
    required this.description,
    required this.color,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
