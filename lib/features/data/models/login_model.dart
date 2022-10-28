import 'dart:convert';

class LoginModel {
  bool? result;
  String? confirmToken;
  int? code;

  LoginModel({
    this.result,
    this.confirmToken,
    this.code,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        result: json["result"] == null ? null : json["result"],
        confirmToken:
            json["confirm_token"] == null ? null : json["confirm_token"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "confirm_token": confirmToken == null ? null : confirmToken,
        "code": code == null ? null : code,
      };
}
