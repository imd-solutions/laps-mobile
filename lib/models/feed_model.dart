import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  Feed({
    this.type,
    this.content,
    this.id,
    this.title,
    this.image,
    this.address,
    this.overview,
    this.date,
    this.adType,
    this.desktopImage,
    this.mobileImage,
    this.link,
    required this.missing,
    required this.roles,
    this.timeAgo,
    this.name,
    this.isAdmin,
    this.likes,
    this.replies,
  });

  String? type;
  String? content;
  int? id;
  String? title;
  dynamic image;
  String? address;
  String? overview;
  String? date;
  String? adType;
  String? desktopImage;
  String? mobileImage;
  String? link;
  List<String>? missing;
  List<Roles>? roles;
  String? timeAgo;
  String? name;
  bool? isAdmin;
  int? likes;
  int? replies;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
        type: json["type"] == null ? "" : json["type"],
        content: json["content"] == null ? "" : json["content"],
        id: json["id"] == null ? 0 : json["id"],
        title: json["title"] == null ? "" : json["title"],
        image: json["image"] == null ? null : json["image"],
        address: json["address"] == null ? "" : json["address"],
        overview: json["overview"] == null ? "" : json["overview"],
        date: json["date"] == null ? "" : json["date"],
        adType: json["adType"] == null ? "" : json["adType"],
        desktopImage: json["desktopImage"] == null ? "" : json["desktopImage"],
        mobileImage: json["mobileImage"] == null ? "" : json["mobileImage"],
        link: json["link"] == null ? "" : json["link"],
        missing: json["missing"] == null ? [] : List<String>.from(json["missing"].map((x) => x)),
        roles: json["roles"] == null ? [] : List<Roles>.from(json["roles"].map((x) => Roles.fromJson(x))),
        timeAgo: json["timeAgo"] == null ? "" : json["timeAgo"],
        name: json["name"] == null ? "" : json["name"],
        isAdmin: json["isAdmin"] == null ? false : json["isAdmin"],
        likes: json["likes"] == null ? 0 : json["likes"],
        replies: json["replies"] == null ? 0 : json["replies"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "content": content,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "address": address == null ? null : address,
        "overview": overview == null ? null : overview,
        "date": date == null ? null : date,
        "adType": adType == null ? null : adType,
        "desktopImage": desktopImage == null ? null : desktopImage,
        "mobileImage": mobileImage == null ? null : mobileImage,
        "link": link == null ? null : link,
        "missing": missing == null ? [] : List<dynamic>.from(missing!.map((x) => x)),
        "roles": roles == null ? null : List<dynamic>.from(roles!.map((x) => x.toJson())),
        "timeAgo": timeAgo == null ? null : timeAgo,
        "name": name == null ? null : name,
        "isAdmin": isAdmin == null ? null : isAdmin,
        "likes": likes == null ? null : likes,
        "replies": replies == null ? null : replies,
      };
}

class ImageClass {
  ImageClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory ImageClass.fromJson(Map<String, dynamic> json) => ImageClass(
        name: json["Name"],
        url: json["Url"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Url": url,
      };
}

class Roles {
  Roles({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory Roles.fromJson(Map<String, dynamic> json) => Roles(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
