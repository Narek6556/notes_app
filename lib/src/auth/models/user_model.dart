import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'user_model.g.dart';

var uuid = const Uuid();

@JsonSerializable()
class UserModel {
  String id = uuid.v4();
  String userName;
  String? email;
  String password;

  UserModel({required this.userName, required this.password, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
