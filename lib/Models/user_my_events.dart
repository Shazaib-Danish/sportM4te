// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

import 'dart:ffi';

UserMyEvents userMyEventsFromJson(String str) =>
    UserMyEvents.fromJson(json.decode(str));

String userMyEventsToJson(UserMyEvents data) => json.encode(data.toJson());

class UserMyEvents {
  UserMyEvents({
    required this.hosting,
    required this.hosted,
    required this.upcoming,
    required this.going,
    required this.pastEvents,
  });

  List<Host> hosting;
  List<Host> hosted;
  List<dynamic> upcoming;
  List<Going> going;
  List<Going> pastEvents;

  factory UserMyEvents.fromJson(Map<String, dynamic> json) => UserMyEvents(
        hosting: List<Host>.from(json["hosting"].map((x) => Host.fromJson(x))),
        hosted: List<Host>.from(json["hosted"].map((x) => Host.fromJson(x))),
        upcoming: List<dynamic>.from(json["upcoming"].map((x) => x)),
        going: List<Going>.from(json["going"].map((x) => Going.fromJson(x))),
        pastEvents:
            List<Going>.from(json["pastEvents"].map((x) => Going.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hosting": List<dynamic>.from(hosting.map((x) => x.toJson())),
        "hosted": List<dynamic>.from(hosted.map((x) => x.toJson())),
        "upcoming": List<dynamic>.from(upcoming.map((x) => x)),
        "going": List<dynamic>.from(going.map((x) => x.toJson())),
        "pastEvents": List<dynamic>.from(pastEvents.map((x) => x.toJson())),
      };
}

class Going {
  Going({
    required this.id,
    required this.type,
    this.score,
    required this.approved,
    required this.user,
  });

  int? id;
  String type;
  dynamic score;
  bool approved;
  User user;

  factory Going.fromJson(Map<String, dynamic> json) => Going(
        id: json["id"],
        type: json["type"],
        score: json["score"],
        approved: json["approved"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "score": score,
        "approved": approved,
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
    this.bio,
    required this.timezone,
    required this.image,
  });

  int? id;
  String username;
  String email;
  Level gender;
  Deadline birthdate;
  List<dynamic> blocked;
  List<SportElement> sports;
  Stats stats;
  Level unit;
  Location location;
  dynamic bio;
  Level timezone;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        gender: Level.fromJson(json["gender"]),
        birthdate: Deadline.fromJson(json["birthdate"]),
        blocked: List<dynamic>.from(json["blocked"].map((x) => x)),
        sports: List<SportElement>.from(
            json["sports"].map((x) => SportElement.fromJson(x))),
        stats: Stats.fromJson(json["stats"]),
        unit: Level.fromJson(json["unit"]),
        location: Location.fromJson(json["location"]),
        bio: json["bio"],
        timezone: Level.fromJson(json["timezone"]),
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

class Deadline {
  Deadline({
    required this.date,
    required this.formatted,
  });

  String? date;
  String? formatted;

  factory Deadline.fromJson(Map<String?, dynamic> json) => Deadline(
        date: json["date"] ?? '',
        formatted: json["formatted"],
      );

  Map<String?, dynamic> toJson() => {
        "date": date,
        "formatted": formatted,
      };
}

class Level {
  Level({
    required this.id,
    required this.formatted,
  });

  int? id;
  Formatted? formatted;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        formatted: formattedValues.map[json["formatted"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "formatted": formattedValues.reverse[formatted],
      };
}

enum Formatted { MALE, EUROPE_BRATISLAVA, MI, SEMI_PROFESSIONAL }

final formattedValues = EnumValues({
  "Europe/Bratislava": Formatted.EUROPE_BRATISLAVA,
  "Male": Formatted.MALE,
  "mi": Formatted.MI,
  "Semi-Professional": Formatted.SEMI_PROFESSIONAL
});

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
        id: json["id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
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

  int? id;
  int? priority;
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

  int? id;
  String? slug;
  String image;
  String? name;
  String? emoji;

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

  int? friends;
  int? hosting;
  int? going;

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

class Host {
  Host({
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

  int? id;
  String event;
  String description;
  String link;
  bool public;
  Location location;
  Level level;
  Dates dates;
  Deadline deadline;
  Limits limits;
  User owner;

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        event: json["event"],
        description: json["description"],
        link: json["link"],
        public: json["public"],
        location: Location.fromJson(json["location"]),
        level: Level.fromJson(json["level"]),
        dates: Dates.fromJson(json["dates"]),
        deadline: Deadline.fromJson(json["deadline"]),
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

  String oneline;
  Deadline start;
  Deadline end;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        oneline: json["oneline"],
        start: Deadline.fromJson(json["start"]),
        end: Deadline.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "oneline": oneline,
        "start": start.toJson(),
        "end": end.toJson(),
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

  String? deadline;
  bool deadlineReached;
  int? limit;
  int? members;
  bool membersReached;

  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
        deadline: json["deadline"] ?? "",
        deadlineReached: json["deadline_reached"] ?? false,
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
