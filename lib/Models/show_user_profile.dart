// To parse this JSON data, do
//
//     final ShowUserProfile = ShowUserProfileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShowUserProfile ShowUserProfileFromJson(String str) =>
    ShowUserProfile.fromJson(json.decode(str));

String ShowUserProfileToJson(ShowUserProfile data) =>
    json.encode(data.toJson());

class ShowUserProfile {
  ShowUserProfile({
    required this.user,
    required this.permissions,
    required this.friends,
    required this.reviews,
    required this.events,
  });

  final User user;
  final Permissions permissions;
  final Friends friends;
  final Reviews reviews;
  final Events events;

  factory ShowUserProfile.fromJson(Map<String, dynamic> json) =>
      ShowUserProfile(
        user: User.fromJson(json["user"]),
        permissions: Permissions.fromJson(json["permissions"]),
        friends: Friends.fromJson(json["friends"]),
        reviews: Reviews.fromJson(json["reviews"]),
        events: Events.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "permissions": permissions.toJson(),
        "friends": friends.toJson(),
        "reviews": reviews.toJson(),
        "events": events.toJson(),
      };
}

class Events {
  Events({
    required this.public,
    required this.private,
  });

  final List<dynamic> public;
  final List<dynamic> private;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        public: List<dynamic>.from(json["public"].map((x) => x)),
        private: List<dynamic>.from(json["private"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "public": List<dynamic>.from(public.map((x) => x)),
        "private": List<dynamic>.from(private.map((x) => x)),
      };
}

class Friends {
  Friends({
    required this.state,
    required this.list,
  });

  final dynamic state;
  final List<dynamic> list;

  factory Friends.fromJson(Map<String, dynamic> json) => Friends(
        state: json["state"],
        list: List<dynamic>.from(json["list"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "state": state,
        "list": List<dynamic>.from(list.map((x) => x)),
      };
}

class Permissions {
  Permissions({
    required this.review,
  });

  final bool review;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "review": review,
      };
}

class Reviews {
  Reviews({
    required this.received,
  });

  final List<Received> received;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        received: List<Received>.from(
            json["received"].map((x) => Received.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "received": List<dynamic>.from(received.map((x) => x.toJson())),
      };
}

class Received {
  Received({
    required this.id,
    required this.authorId,
    required this.userId,
    required this.stars,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.author,
  });

  final int id;
  final int authorId;
  final int userId;
  final int stars;
  final String review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User author;

  factory Received.fromJson(Map<String, dynamic> json) => Received(
        id: json["id"],
        authorId: json["author_id"],
        userId: json["user_id"],
        stars: json["stars"],
        review: json["review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        author: User.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author_id": authorId,
        "user_id": userId,
        "stars": stars,
        "review": review,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "author": author.toJson(),
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
    required this.bio,
    required this.timezone,
    required this.image,
  });

  final int id;
  final String username;
  final String email;
  final Gender gender;
  final Birthdate birthdate;
  final List<dynamic> blocked;
  final List<SportElement> sports;
  final Stats stats;
  final Gender unit;
  final Location location;
  final dynamic bio;
  final Gender timezone;
  final String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"] == null ? null : json["email"],
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
        "email": email == null ? null : email,
        "gender": gender.toJson(),
        "birthdate": birthdate.toJson(),
        "blocked":
            blocked == null ? null : List<dynamic>.from(blocked.map((x) => x)),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "stats": stats.toJson(),
        "unit": unit.toJson(),
        "location": location == null ? null : location.toJson(),
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

  final DateTime date;
  final String formatted;

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

  final int id;
  final String formatted;

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
    required this.id,
    required this.lat,
    required this.lng,
    required this.formatted,
  });

  final dynamic id;
  final dynamic lat;
  final dynamic lng;
  final dynamic formatted;

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

  final int id;
  final int priority;
  final SportSport sport;

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

  final int id;
  final String slug;
  final String image;
  final String name;
  final String emoji;

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

  final int friends;
  final int hosting;
  final int going;

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
