import 'dart:convert';
import './../models/models.dart';
Jobs jobsFromJson(String str) => Jobs.fromJson(json.decode(str));

String jobsToJson(Jobs data) => json.encode(data.toJson());

class Jobs {
  Jobs({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
  });

  int id;
  DateTime date;
  String slug;
  WPGuid title;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    title: WPGuid.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "slug": slug,
    "title": title.toJson(),
  };
}