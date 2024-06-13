import 'package:json_annotation/json_annotation.dart';

part 'loginModel.g.dart';


@JsonSerializable()
class LoginModel {
  final String username;
  final String password;
  LoginModel({required this.password, required this.username});

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

}