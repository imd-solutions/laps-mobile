// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import './../models/models.dart';
import 'dart:convert';

Video videoFromJson(String str) => Video.fromJson(json.decode(str));

String videoToJson(Video data) => json.encode(data.toJson());

class Video {
  Video({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
    required this.acf,
    required this.laps,
  });

  int id;
  DateTime date;
  String slug;
  WPGuid title;
  AcfOverview acf;
  LapsYoutube laps;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    title: WPGuid.fromJson(json["title"]),
    acf: AcfOverview.fromJson(json["acf"]),
    laps: LapsYoutube.fromJson(json["laps"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "slug": slug,
    "title": title.toJson(),
    "acf": acf.toJson(),
    "laps": laps.toJson(),
  };
}
