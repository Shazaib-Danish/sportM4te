// To parse this JSON data, do
//
//     final showUserProfile = showUserProfileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ShowUserProfile showUserProfileFromJson(String str) =>
    ShowUserProfile.fromJson(json.decode(str));

String showUserProfileToJson(ShowUserProfile data) =>
    json.encode(data.toJson());

class ShowUserProfile {
  ShowUserProfile({
    required this.user,
    required this.permissions,
    required this.friends,
    required this.reviews,
    required this.events,
  });

  User user;
  Permissions permissions;
  Friends friends;
  Reviews reviews;
  Events events;

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

  List<Public> public;
  List<dynamic> private;

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        public:
            List<Public>.from(json["public"].map((x) => Public.fromJson(x))),
        private: List<dynamic>.from(json["private"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "public": List<dynamic>.from(public.map((x) => x.toJson())),
        "private": List<dynamic>.from(private.map((x) => x)),
      };
}

class Public {
  Public({
    required this.id,
    required this.event,
    required this.description,
    required this.link,
    required this.public,
    required this.location,
    required this.level,
    required this.dates,
    required this.deadline,
    required this.limits,
    required this.owner,
  });

  int id;
  String event;
  String description;
  String link;
  bool public;
  Location location;
  Gender level;
  Dates dates;
  Birthdate deadline;
  Limits limits;
  User owner;

  factory Public.fromJson(Map<String, dynamic> json) => Public(
        id: json["id"],
        event: json["event"],
        description: json["description"],
        link: json["link"],
        public: json["public"],
        location: Location.fromJson(json["location"]),
        level: Gender.fromJson(json["level"]),
        dates: Dates.fromJson(json["dates"]),
        deadline: Birthdate.fromJson(json["deadline"]),
        limits: Limits.fromJson(json["limits"]),
        owner: User.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event": event,
        "description": description,
        "link": link,
        "public": public,
        "location": location.toJson(),
        "level": level.toJson(),
        "dates": dates.toJson(),
        "deadline": deadline.toJson(),
        "limits": limits.toJson(),
        "owner": owner.toJson(),
      };
}

class Dates {
  Dates({
    required this.oneline,
    required this.start,
    required this.end,
  });

  String? oneline;
  Birthdate start;
  Birthdate end;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        oneline: json["oneline"],
        start: Birthdate.fromJson(json["start"]),
        end: Birthdate.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "oneline": oneline,
        "start": start.toJson(),
        "end": end.toJson(),
      };
}

class Birthdate {
  Birthdate({
    required this.date,
    required this.formatted,
  });

  DateTime? date;
  String? formatted;

  factory Birthdate.fromJson(Map<String, dynamic> json) => Birthdate(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        formatted: json["formatted"] == null ? null : json["formatted"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date!.toIso8601String(),
        "formatted": formatted == null ? null : formatted,
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

class Limits {
  Limits({
    required this.deadline,
    required this.deadlineReached,
    required this.limit,
    required this.members,
    required this.membersReached,
  });

  dynamic deadline;
  bool deadlineReached;
  dynamic limit;
  int members;
  bool membersReached;

  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        deadline: json["deadline"],
        deadlineReached: json["deadline_reached"],
        limit: json["limit"],
        members: json["members"],
        membersReached: json["members_reached"],
      );

  Map<String, dynamic> toJson() => {
        "deadline": deadline,
        "deadline_reached": deadlineReached,
        "limit": limit,
        "members": members,
        "members_reached": membersReached,
      };
}

class Location {
  Location({
    required this.id,
    required this.lat,
    required this.lng,
    required this.formatted,
  });

  int? id;
  double? lat;
  double? lng;
  String? formatted;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"] == null ? null : json["id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        formatted: json["formatted"] == null ? null : json["formatted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "formatted": formatted == null ? null : formatted,
      };
}

class Blocked {
  Blocked({
    required this.user,
  });

  User user;

  factory Blocked.fromJson(Map<String, dynamic> json) => Blocked(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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

  int id;
  String username;
  String? email;
  Gender gender;
  Birthdate birthdate;
  List<Blocked> blocked;
  List<SportElement> sports;
  Stats stats;
  Gender unit;
  Location? location;
  dynamic bio;
  Gender timezone;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"] == null ? null : json["email"],
        gender: Gender.fromJson(json["gender"]),
        birthdate: Birthdate.fromJson(json["birthdate"]),
        blocked: json["blocked"] == null
            ? []
            : List<Blocked>.from(
                json["blocked"].map((x) => Blocked.fromJson(x))),
        sports: List<SportElement>.from(
            json["sports"].map((x) => SportElement.fromJson(x))),
        stats: Stats.fromJson(json["stats"]),
        unit: Gender.fromJson(json["unit"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
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
        "blocked": blocked == null
            ? null
            : List<dynamic>.from(blocked.map((x) => x.toJson())),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "stats": stats.toJson(),
        "unit": unit.toJson(),
        "location": location == null ? null : location!.toJson(),
        "bio": bio,
        "timezone": timezone.toJson(),
        "image": image,
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

class Friends {
  Friends({
    required this.state,
    required this.list,
  });

  dynamic state;
  List<dynamic> list;

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

  bool review;

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

  List<dynamic> received;

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        received: List<dynamic>.from(json["received"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "received": List<dynamic>.from(received.map((x) => x)),
      };
}
