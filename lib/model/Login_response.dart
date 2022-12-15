// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

List<LoginResponse> loginResponseFromJson(String str) =>
    List<LoginResponse>.from(
        json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  LoginResponse({
    this.userId,
    this.roleId,
    this.status,
  });

  int? userId;
  int? roleId;
  bool? status;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["UserId"],
        roleId: json["RoleId"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "RoleId": roleId,
        "Status": status,
      };
}
