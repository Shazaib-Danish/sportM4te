// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    required this.event,
    required this.message,
    required this.redirect,
  });

  Event event;
  String message;
  String redirect;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        event: Event.fromJson(json["event"]),
        message: json["message"],
        redirect: json["redirect"],
      );

  Map<String, dynamic> toJson() => {
        "event": event.toJson(),
        "message": message,
        "redirect": redirect,
      };
}

class Event {
  Event({
    required this.id,
    required this.authorId,
    required this.userId,
    required this.stars,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int authorId;
  int userId;
  String stars;
  String? review;
  DateTime createdAt;
  DateTime updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        authorId: json["author_id"],
        userId: json["user_id"],
        stars: json["stars"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "user_id": userId,
        "stars": stars,
        "review": review,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
