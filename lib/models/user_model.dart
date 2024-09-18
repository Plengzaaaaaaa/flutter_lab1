// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String id;
  String userName;
  String password;
  String name;
  String role;

  UserModel({
    required this.id,
    required this.userName,
    required this.password,
    required this.name,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        userName: json["user_name"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_name": userName,
        "password": password,
        "name": name,
        "role": role,
      };
}


// Define AuthResponse
class AuthResponse {
  final UserModel user;
  final String accessToken;
  final String refreshToken;
  final String role;

  AuthResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    user: UserModel.fromJson(json['user']),
    accessToken: json['accessToken'],
    refreshToken: json['refreshToken'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'role': role,
  };
}