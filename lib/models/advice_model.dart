// To parse this JSON data, do
//
//     final advice = adviceFromJson(jsonString);
import './../models/models.dart';

import 'dart:convert';

Advice adviceFromJson(String str) => Advice.fromJson(json.decode(str));

String adviceToJson(Advice data) => json.encode(data.toJson());

class Advice {
  Advice({
    required this.id,
    required this.date,
    this.slug,
    required this.title,
    required this.content,
    this.acf,
  });

  int id;
  DateTime date;
  String? slug;
  WPGuid title;
  WPContent content;
  AcfFeatured? acf;

  factory Advice.fromJson(Map<String, dynamic> json) => Advice(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        title: WPGuid.fromJson(json["title"]),
        content: WPContent.fromJson(json["content"]),
        acf: json["acf"]["featured_image"] != false ? AcfFeatured.fromJson(json["acf"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "title": title.toJson(),
        "content": content.toJson(),
        "acf": acf?.toJson(),
      };
}
