// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import './../models/models.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.id,
    required this.date,
    required this.guid,
    required this.slug,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    this.acf,
  });

  int id;
  DateTime date;
  WPGuid guid;
  String slug;
  String link;
  WPGuid title;
  WPContent content;
  WPContent excerpt;
  Acf? acf;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    guid: WPGuid.fromJson(json["guid"]),
    slug: json["slug"],
    link: json["link"],
    title: WPGuid.fromJson(json["title"]),
    content: WPContent.fromJson(json["content"]),
    excerpt: WPContent.fromJson(json["excerpt"]),
    acf: Acf.fromJson(json["acf"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "guid": guid.toJson(),
    "slug": slug,
    "link": link,
    "title": title.toJson(),
    "content": content.toJson(),
    "excerpt": excerpt.toJson(),
    "acf": acf?.toJson(),
  };
}

class Acf {
  Acf({
    required this.bannerImage,
  });

  BannerImage bannerImage;

  factory Acf.fromJson(Map<String, dynamic> json) => Acf(
    bannerImage: BannerImage.fromJson(json["banner_image"]),
  );

  Map<String, dynamic> toJson() => {
    "banner_image": bannerImage.toJson(),
  };
}

class BannerImage {
  BannerImage({
    required this.id,
    required this.url,
  });

  int id;
  String url;

  factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
    id: json["ID"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "url": url,
  };
}

class Author {
  Author({
    required this.embeddable,
    required this.href,
  });

  bool embeddable;
  String href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
  };
}
