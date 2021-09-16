// To parse this JSON data, do
//
//     final career = careerFromJson(jsonString);

import 'dart:convert';
import './../models/models.dart';

Career careerFromJson(String str) => Career.fromJson(json.decode(str));

String careerToJson(Career data) => json.encode(data.toJson());

class Career {
  Career({
    required this.id,
    required this.date,
    required this.slug,
    required this.title,
    required this.laps,
    required this.acf,
  });

  int id;
  DateTime date;
  String slug;
  WPGuid title;
  AcfFeatured acf;
  Laps laps;

  factory Career.fromJson(Map<String, dynamic> json) => Career(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        slug: json["slug"],
        title: WPGuid.fromJson(json["title"]),
        acf: AcfFeatured.fromJson(json["acf"]),
        laps: Laps.fromJson(json["laps"]),
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

class Laps {
  Laps({
    required this.sectorId,
  });

  String sectorId;

  factory Laps.fromJson(Map<String, dynamic> json) => Laps(
        sectorId: json["sector_id"],
      );

  Map<String, dynamic> toJson() => {
        "sector_id": sectorId,
      };
}
