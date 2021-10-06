// To parse this JSON data, do
//
//     final unesendRequest = unesendRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UnesendRequest unesendRequestFromJson(String str) =>
    UnesendRequest.fromJson(json.decode(str));

String unesendRequestToJson(UnesendRequest data) => json.encode(data.toJson());

class UnesendRequest {
  UnesendRequest({
    required this.message,
  });

  String message;

  factory UnesendRequest.fromJson(Map<String, dynamic> json) => UnesendRequest(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
