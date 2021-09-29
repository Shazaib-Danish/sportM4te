// To parse this JSON data, do
//
//     final userMyEvents = userMyEventsFromJson(jsonString);

import 'dart:convert';

UserMyEventsDetails userMyEventsFromJson(String str) => UserMyEventsDetails.fromJson(json.decode(str));

String userMyEventsToJson(UserMyEventsDetails data) => json.encode(data.toJson());

class UserMyEventsDetails {
  UserMyEventsDetails({
    required this.event,
    required this.members,
  });

  Event event;
  List<UserMyEventsMember> members;

  factory UserMyEventsDetails.fromJson(Map<String, dynamic> json) => UserMyEventsDetails(
    event: Event.fromJson(json["event"]),
    members: List<UserMyEventsMember>.from(json["members"].map((x) => UserMyEventsMember.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "event": event.toJson(),
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Event {
  Event({
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
  Level level;
  Dates dates;
  Deadline deadline;
  Limits limits;
  Owner owner;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
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
    owner: Owner.fromJson(json["owner"]),
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

class Deadline {
  Deadline({
    required this.date,
    required this.formatted,
  });

  DateTime? date;
  String formatted;

  factory Deadline.fromJson(Map<String, dynamic> json) => Deadline(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    formatted: json["formatted"] == null ? null : json["formatted"],
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : date!.toIso8601String(),
    "formatted": formatted == null ? null : formatted,
  };
}

class Level {
  Level({
    required this.id,
    required this.formatted,
  });

  int id;
  String formatted;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
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
    this.deadline,
    required this.deadlineReached,
    this.limit,
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

  int id;
  double lat;
  double lng;
  String formatted;

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

class Owner {
  Owner({
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
  Level gender;
  Deadline birthdate;
  List<dynamic>? blocked;
  List<SportElement> sports;
  Stats stats;
  Level unit;
  Location? location;
  dynamic bio;
  Level timezone;
  String image;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    username: json["username"],
    email: json["email"] == null ? null : json["email"],
    gender: Level.fromJson(json["gender"]),
    birthdate: Deadline.fromJson(json["birthdate"]),
    blocked: json["blocked"] == null ? null : List<dynamic>.from(json["blocked"].map((x) => x)),
    sports: List<SportElement>.from(json["sports"].map((x) => SportElement.fromJson(x))),
    stats: Stats.fromJson(json["stats"]),
    unit: Level.fromJson(json["unit"]),
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    bio: json["bio"],
    timezone: Level.fromJson(json["timezone"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email == null ? null : email,
    "gender": gender.toJson(),
    "birthdate": birthdate.toJson(),
    "blocked": blocked == null ? null : List<dynamic>.from(blocked!.map((x) => x)),
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

class UserMyEventsMember {
  UserMyEventsMember({
    required this.id,
    required this.type,
    required this.name,
    this.score,
    required this.members,
    required this.approved,
    required this.user,
  });

  int id;
  String type;
  String name;
  dynamic score;
  List<MemberMember>? members;
  bool approved;
  Owner? user;

  factory UserMyEventsMember.fromJson(Map<String, dynamic> json) => UserMyEventsMember(
    id: json["id"],
    type: json["type"],
    name: json["name"] == null ? null : json["name"],
    score: json["score"],
    members: json["members"] == null ? null : List<MemberMember>.from(json["members"].map((x) => MemberMember.fromJson(x))),
    approved: json["approved"] == null ? null : json["approved"],
    user: json["user"] == null ? null : Owner.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name == null ? null : name,
    "score": score,
    "members": members == null ? null : List<dynamic>.from(members!.map((x) => x.toJson())),
    "approved": approved == null ? null : approved,
    "user": user == null ? null : user!.toJson(),
  };
}

class MemberMember {
  MemberMember({
    required this.id,
    required this.type,
    required this.user,
  });

  int id;
  String type;
  Owner user;

  factory MemberMember.fromJson(Map<String, dynamic> json) => MemberMember(
    id: json["id"],
    type: json["type"],
    user: Owner.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "user": user.toJson(),
  };
}
