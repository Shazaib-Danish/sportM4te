// To parse this JSON data, do
//
//     final searchEvents = searchEventsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SearchEvents searchEventsFromJson(String str) =>
    SearchEvents.fromJson(json.decode(str));

String searchEventsToJson(SearchEvents data) => json.encode(data.toJson());

class SearchEvents {
  SearchEvents({
    required this.search,
    required this.user,
    required this.filters,
    required this.events,
  });

  bool search;
  User user;
  Filters filters;
  Events events;

  factory SearchEvents.fromJson(Map<String, dynamic> json) => SearchEvents(
        search: json["search"],
        user: User.fromJson(json["user"]),
        filters: Filters.fromJson(json["filters"]),
        events: Events.fromJson(json["events"]),
      );

  Map<String, dynamic> toJson() => {
        "search": search,
        "user": user.toJson(),
        "filters": filters.toJson(),
        "events": events.toJson(),
      };
}

class Events {
  Events({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
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

  factory Events.fromJson(Map<String, dynamic> json) => Events(
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
  DatumDates dates;
  Deadline deadline;
  Limits limits;
  Owner owner;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        event: json["event"],
        description: json["description"],
        link: json["link"],
        public: json["public"],
        location: Location.fromJson(json["location"]),
        level: Level.fromJson(json["level"]),
        dates: DatumDates.fromJson(json["dates"]),
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

class DatumDates {
  DatumDates({
    required this.oneline,
    required this.start,
    required this.end,
  });

  String oneline;
  Deadline start;
  Deadline end;

  factory DatumDates.fromJson(Map<String, dynamic> json) => DatumDates(
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
  String? formatted;

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

  Owner user;

  factory Blocked.fromJson(Map<String, dynamic> json) => Blocked(
        user: Owner.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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
    required this.bio,
    required this.timezone,
    required this.image,
  });

  int id;
  String username;
  String? email;
  Level gender;
  Deadline birthdate;
  List<Blocked> blocked;
  List<ListElement> sports;
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
        blocked: json["blocked"] == null
            ? []
            : List<Blocked>.from(
                json["blocked"].map((x) => Blocked.fromJson(x))),
        sports: List<ListElement>.from(
            json["sports"].map((x) => ListElement.fromJson(x))),
        stats: Stats.fromJson(json["stats"]),
        unit: Level.fromJson(json["unit"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
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

class ListElement {
  ListElement({
    required this.id,
    required this.priority,
    required this.sport,
  });

  int id;
  int priority;
  Sport sport;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        priority: json["priority"],
        sport: Sport.fromJson(json["sport"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "priority": priority,
        "sport": sport.toJson(),
      };
}

class Sport {
  Sport({
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

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
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

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}

class Filters {
  Filters({
    required this.text,
    required this.sports,
    required this.dates,
  });

  dynamic text;
  List<Sport> sports;
  FiltersDates dates;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        text: json["text"],
        sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
        dates: FiltersDates.fromJson(json["dates"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
        "dates": dates.toJson(),
      };
}

class FiltersDates {
  FiltersDates({
    required this.today,
    required this.tommorow,
    required this.thisWeek,
    required this.thisWeekend,
    required this.nextWeek,
    required this.nextWeekend,
    required this.inTheNextMonth,
  });

  List<dynamic> today;
  List<String> tommorow;
  List<dynamic> thisWeek;
  List<dynamic> thisWeekend;
  List<dynamic> nextWeek;
  List<dynamic> nextWeekend;
  List<dynamic> inTheNextMonth;

  factory FiltersDates.fromJson(Map<String, dynamic> json) => FiltersDates(
        today: List<dynamic>.from(json["Today"].map((x) => x)),
        tommorow: List<String>.from(json["Tommorow"].map((x) => x)),
        thisWeek: List<dynamic>.from(json["This Week"].map((x) => x)),
        thisWeekend: List<dynamic>.from(json["This Weekend"].map((x) => x)),
        nextWeek: List<dynamic>.from(json["Next Week"].map((x) => x)),
        nextWeekend: List<dynamic>.from(json["Next Weekend"].map((x) => x)),
        inTheNextMonth:
            List<dynamic>.from(json["In the Next Month"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Today": List<dynamic>.from(today.map((x) => x)),
        "Tommorow": List<dynamic>.from(tommorow.map((x) => x)),
        "This Week": List<dynamic>.from(thisWeek.map((x) => x)),
        "This Weekend": List<dynamic>.from(thisWeekend.map((x) => x)),
        "Next Week": List<dynamic>.from(nextWeek.map((x) => x)),
        "Next Weekend": List<dynamic>.from(nextWeekend.map((x) => x)),
        "In the Next Month": List<dynamic>.from(inTheNextMonth.map((x) => x)),
      };
}

class User {
  User({
    required this.sports,
  });

  Sports sports;

  factory User.fromJson(Map<String, dynamic> json) => User(
        sports: Sports.fromJson(json["sports"]),
      );

  Map<String, dynamic> toJson() => {
        "sports": sports.toJson(),
      };
}

class Sports {
  Sports({
    required this.total,
    required this.list,
  });

  int total;
  List<ListElement> list;

  factory Sports.fromJson(Map<String, dynamic> json) => Sports(
        total: json["total"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}
