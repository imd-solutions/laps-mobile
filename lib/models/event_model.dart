// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';
import './../models/models.dart';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  Event({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
    required this.content,
    required this.acf,
  });

  int id;
  DateTime date;
  String slug;
  WPGuid title;
  WPContent content;
  AcfListImage acf;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    title: WPGuid.fromJson(json["title"]),
    content: WPContent.fromJson(json["content"]),
    acf: AcfListImage.fromJson(json["acf"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "slug": slug,
    "title": title.toJson(),
    "content": content.toJson(),
    "acf": acf.toJson(),
  };
}