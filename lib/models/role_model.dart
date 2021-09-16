// To parse this JSON data, do
//
//     final role = roleFromJson(jsonString);

import 'dart:convert';
import './../../models/models.dart';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());

class Role {
  Role({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
    required this.acf,
  });

  int id;
  DateTime date;
  String slug;
  WPGuid title;
  AcfFeaturedRole acf;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        title: WPGuid.fromJson(json["title"]),
        acf: AcfFeaturedRole.fromJson(json["acf"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "slug": slug,
        "title": title.toJson(),
        "acf": acf.toJson(),
      };
}
