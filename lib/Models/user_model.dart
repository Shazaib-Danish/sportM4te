// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.token,
    required this.message,
    required this.redirect,
  });

  User user;
  String token;
  String message;
  String redirect;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        token: json["token"],
        message: json["message"],
        redirect: json["redirect"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
        "message": message,
        "redirect": redirect,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.gender,
    required this.birthdate,
    required this.blocked,
    required this.sports,
    required this.stats,
    required this.unit,
    required this.location,
    this.bio,
    required this.timezone,
    required this.image,
  });

  int id;
  String username;
  String email;
  Gender gender;
  Birthdate birthdate;
  List<dynamic> blocked;
  List<SportElement> sports;
  Stats stats;
  Gender unit;
  Location location;
  dynamic bio;
  Gender timezone;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        gender: Gender.fromJson(json["gender"]),
        birthdate: Birthdate.fromJson(json["birthdate"]),
        blocked: List<dynamic>.from(json["blocked"].map((x) => x)),
        sports: List<SportElement>.from(
            json["sports"].map((x) => SportElement.fromJson(x))),
        stats: Stats.fromJson(json["stats"]),
        unit: Gender.fromJson(json["unit"]),
        location: Location.fromJson(json["location"]),
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
        "blocked": List<dynamic>.from(blocked.map((x) => x)),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "stats": stats.toJson(),
        "unit": unit.toJson(),
        "location": location.toJson(),
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

class Location {
  Location({
    this.id,
    this.lat,
    this.lng,
    this.formatted,
  });

  dynamic id;
  dynamic lat;
  dynamic lng;
  dynamic formatted;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        lat: json["lat"],
        lng: json["lng"],
        formatted: json["formatted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lat": lat,
        "lng": lng,
        "formatted": formatted,
      };
}

class SportElement {
  SportElement({
    required this.id,
    required this.priority,
    required this.sport,
  });

  int id;
  int priority;
  SportSport sport;

  factory SportElement.fromJson(Map<String, dynamic> json) => SportElement(
        id: json["id"],
        priority: json["priority"],
        sport: SportSport.fromJson(json["sport"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "priority": priority,
        "sport": sport.toJson(),
      };
}

class SportSport {
  SportSport({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
    required this.emoji,
  });

  int id;
  String slug;
  String image;
  String name;
  String emoji;

  factory SportSport.fromJson(Map<String, dynamic> json) => SportSport(
        id: json["id"],
        slug: json["slug"],
        image: json["image"],
        name: json["name"],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "image": image,
        "name": name,
        "emoji": emoji,
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
