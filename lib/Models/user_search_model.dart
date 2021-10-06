// To parse this JSON data, do
//
//     final userSearchModel = userSearchModelFromJson(jsonString);

import 'dart:convert';

UserSearchModel userSearchModelFromJson(String str) =>
    UserSearchModel.fromJson(json.decode(str));

String userSearchModelToJson(UserSearchModel data) =>
    json.encode(data.toJson());

class UserSearchModel {
  UserSearchModel({
    required this.filters,
    required this.users,
  });

  Filters filters;
  Users users;

  factory UserSearchModel.fromJson(Map<String, dynamic> json) =>
      UserSearchModel(
        filters: Filters.fromJson(json["filters"]),
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "filters": filters.toJson(),
        "users": users.toJson(),
      };
}

class Filters {
  Filters({
    required this.sports,
  });

  List<FiltersSport> sports;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        sports: List<FiltersSport>.from(
            json["sports"].map((x) => FiltersSport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
      };
}

class FiltersSport {
  FiltersSport({
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

  factory FiltersSport.fromJson(Map<String, dynamic> json) => FiltersSport(
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

class Users {
  Users({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
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
  List<dynamic>? blocked;
  List<DatumSport> sports;
  Stats stats;
  Gender unit;
  Location? location;
  dynamic bio;
  Gender timezone;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        email: json["email"].toString(),
        gender: Gender.fromJson(json["gender"]),
        birthdate: Birthdate.fromJson(json["birthdate"]),
        blocked: json["blocked"] == null
            ? null
            : List<dynamic>.from(json["blocked"].map((x) => x)),
        sports: List<DatumSport>.from(
            json["sports"].map((x) => DatumSport.fromJson(x))),
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
        "email": email,
        "gender": gender.toJson(),
        "birthdate": birthdate.toJson(),
        "blocked":
            blocked == null ? null : List<dynamic>.from(blocked!.map((x) => x)),
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "stats": stats.toJson(),
        "unit": unit.toJson(),
        "location": location == null ? null : location!.toJson(),
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

class DatumSport {
  DatumSport({
    required this.id,
    required this.priority,
    required this.sport,
  });

  int id;
  int priority;
  FiltersSport sport;

  factory DatumSport.fromJson(Map<String, dynamic> json) => DatumSport(
        id: json["id"],
        priority: json["priority"],
        sport: FiltersSport.fromJson(json["sport"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "priority": priority,
        "sport": sport.toJson(),
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

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"].toString(),
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
