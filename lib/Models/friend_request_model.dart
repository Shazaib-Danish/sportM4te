// To parse this JSON data, do
//
//     final friendRequestModel = friendRequestModelFromJson(jsonString);

import 'dart:convert';

FriendRequestModel friendRequestModelFromJson(String str) => FriendRequestModel.fromJson(json.decode(str));

String friendRequestModelToJson(FriendRequestModel data) => json.encode(data.toJson());

class FriendRequestModel {
  FriendRequestModel({
    required this.friend,
    required this.message,
    required this.icon,
  });

  Friend friend;
  String message;
  String icon;

  factory FriendRequestModel.fromJson(Map<String, dynamic> json) => FriendRequestModel(
    friend: Friend.fromJson(json["friend"]),
    message: json["message"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "friend": friend.toJson(),
    "message": message,
    "icon": icon,
  };
}

class Friend {
  Friend({
    required this.id,
    required this.username,
    this.email,
    required this.gender,
    required this.birthdate,
    this.blocked,
    required this.sports,
    required this.stats,
    required this.unit,
    this.location,
    this.bio,
    required this.timezone,
    required this.image,
  });

  int id;
  String username;
  dynamic email;
  Gender gender;
  Birthdate birthdate;
  dynamic blocked;
  List<dynamic> sports;
  Stats stats;
  Gender unit;
  dynamic location;
  dynamic bio;
  Gender timezone;
  String image;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    gender: Gender.fromJson(json["gender"]),
    birthdate: Birthdate.fromJson(json["birthdate"]),
    blocked: json["blocked"],
    sports: List<dynamic>.from(json["sports"].map((x) => x)),
    stats: Stats.fromJson(json["stats"]),
    unit: Gender.fromJson(json["unit"]),
    location: json["location"],
    bio: json["bio"],
    timezone: Gender.fromJson(json["timezone"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "gender": gender.toJson(),
    "birthdate": birthdate.toJson(),
    "blocked": blocked,
    "sports": List<dynamic>.from(sports.map((x) => x)),
    "stats": stats.toJson(),
    "unit": unit.toJson(),
    "location": location,
    "bio": bio,
    "timezone": timezone.toJson(),
    "image": image,
  };
}

class Birthdate {
  Birthdate({
    required this.date,
    required this.formatted,
  });

  DateTime date;
  String formatted;

  factory Birthdate.fromJson(Map<String, dynamic> json) => Birthdate(
    date: DateTime.parse(json["date"]),
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "formatted": formatted,
  };
}

class Gender {
  Gender({
    required this.id,
    required this.formatted,
  });

  int id;
  String formatted;

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
    id: json["id"],
    formatted: json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "formatted": formatted,
  };
}

class Stats {
  Stats({
    required this.friends,
    required this.hosting,
    required this.going,
  });

  int friends;
  int hosting;
  int going;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
    friends: json["friends"],
    hosting: json["hosting"],
    going: json["going"],
  );

  Map<String, dynamic> toJson() => {
    "friends": friends,
    "hosting": hosting,
    "going": going,
  };
}
