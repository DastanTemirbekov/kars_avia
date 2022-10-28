import 'dart:convert';

class ConfirmCodeModel {
  bool? result;
  String? token;

  ConfirmCodeModel({
    this.result,
    this.token,
  });

  factory ConfirmCodeModel.fromRawJson(String str) =>
      ConfirmCodeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) =>
      ConfirmCodeModel(
        result: json["result"] == null ? null : json["result"],
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "token": token == null ? null : token,
      };
}
