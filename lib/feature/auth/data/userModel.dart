
import 'package:json_annotation/json_annotation.dart';

part 'userModel.g.dart';



@JsonSerializable()
class UserModel {
  final String email;
  final String username;
  final String password;

  UserModel({required this.email, required this.username, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}