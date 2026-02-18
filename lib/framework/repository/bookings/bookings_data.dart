// To parse this JSON data, do
//
//     final bookingsData = bookingsDataFromJson(jsonString);

import 'dart:convert';

BookingsData bookingsDataFromJson(String str) => BookingsData.fromJson(json.decode(str));

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
  String? address;
  double? rating;
  String? category;
  String? time;
  String? specialist;
  String? timeSlot;
  String? bookingId;
  Status? status;

  Past({
    this.id,
    this.image,
    this.title,
    this.subTitle,
    this.date,
    this.credit,
    this.address,
    this.rating,
    this.category,
    this.time,
    this.specialist,
    this.timeSlot,
    this.bookingId,
    this.status,
  });

  factory Past.fromJson(Map<String, dynamic> json) => Past(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    subTitle: json["sub_title"] == null ? [] : List<String>.from(json["sub_title"]!.map((x) => x)),
    date: json["date"],
    credit: json["credit"],
    address: json["address"],
    rating: json["rating"]?.toDouble(),
    category: json["category"],
    time: json["time"],
    specialist: json["specialist"],
    timeSlot: json["time_slot"],
    bookingId: json["booking_id"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title,
    "sub_title": subTitle == null ? [] : List<dynamic>.from(subTitle!.map((x) => x)),
    "date": date,
    "credit": credit,
    "address": address,
    "rating": rating,
    "category": category,
    "time": time,
    "specialist": specialist,
    "time_slot": timeSlot,
    "booking_id": bookingId,
    "status": statusValues.reverse[status],
  };
}

enum Status {
  BOOK,
  CONTINUE
}

final statusValues = EnumValues({
  "book": Status.BOOK,
  "continue": Status.CONTINUE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

