// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

BookingsData bookingsFromJson(String str) => BookingsData.fromJson(json.decode(str));

String bookingsDataToJson(BookingsData data) => json.encode(data.toJson());

class BookingsData {
  List<Past>? upcoming;
  List<Past>? past;

  BookingsData({
    this.upcoming,
    this.past,
  });

  factory BookingsData.fromJson(Map<String, dynamic> json) => BookingsData(
    upcoming: json["upcoming"] == null ? [] : List<Past>.from(json["upcoming"]!.map((x) => Past.fromJson(x))),
    past: json["past"] == null ? [] : List<Past>.from(json["past"]!.map((x) => Past.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "upcoming": upcoming == null ? [] : List<dynamic>.from(upcoming!.map((x) => x.toJson())),
    "past": past == null ? [] : List<dynamic>.from(past!.map((x) => x.toJson())),
  };
}

class Past {
  String? id;
  String? image;
  String? title;
  List<String>? subTitle;
  String? date;
  int? credit;

  Past({
    this.id,
    this.image,
    this.title,
    this.subTitle,
    this.date,
    this.credit,
  });

  factory Past.fromJson(Map<String, dynamic> json) => Past(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    subTitle: json["sub_title"] == null ? [] : List<String>.from(json["sub_title"]!.map((x) => x)),
    date: json["date"],
    credit: json["credit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "sub_title": subTitle == null ? [] : List<dynamic>.from(subTitle!.map((x) => x)),
    "date": date,
    "credit": credit,
  };
}
