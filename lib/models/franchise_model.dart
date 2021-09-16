// To parse this JSON data, do
//
//     final franchise = franchiseFromJson(jsonString);

import 'dart:convert';
import './../models/models.dart';
Franchise franchiseFromJson(String str) => Franchise.fromJson(json.decode(str));

String franchiseToJson(Franchise data) => json.encode(data.toJson());

class Franchise {
  Franchise({
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
  AcfFranchise acf;

  factory Franchise.fromJson(Map<String, dynamic> json) => Franchise(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    slug: json["slug"],
    title: WPGuid.fromJson(json["title"]),
    acf: AcfFranchise.fromJson(json["acf"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "slug": slug,
    "title": title.toJson(),
    "acf": acf.toJson(),
  };
}

class AcfFranchise {
  AcfFranchise({
    required this.logo,
    // required this.headerImage,
    required this.headline,
    required this.content,
    required this.bottomYoutubeLink,
  });

  FeaturedImage logo;
  // FeaturedImage headerImage;
  String headline;
  String content;
  String bottomYoutubeLink;

  factory AcfFranchise.fromJson(Map<String, dynamic> json) => AcfFranchise(
    logo: FeaturedImage.fromJson(json["logo"]),
    // headerImage: FeaturedImage.fromJson(json["header_image"]),
    headline: json["headline"],
    content: json["content"],
    bottomYoutubeLink: json["bottom_youtube_link"],
  );

  Map<String, dynamic> toJson() => {
    "logo": logo.toJson(),
    // "header_image": headerImage.toJson(),
    "headline": headline,
    "content": content,
    "bottom_youtube_link": bottomYoutubeLink,
  };
}
