// To parse this JSON data, do
//
//     final community = communityFromJson(jsonString);

import 'dart:convert';

Community communityFromJson(String str) => Community.fromJson(json.decode(str));

String communityToJson(Community data) => json.encode(data.toJson());

class Community {
  Community({
    required this.id,
    required this.title,
    this.date,
    this.image,
    this.timeAgo,
    this.name,
    required this.isAdmin,
    this.content,
    this.likes,
    this.reply,
    this.replies,
    required this.currentUserLikesThread,
    // this.userStatus,
  });

  int id;
  String title;
  String? date;
  String? image;
  String? timeAgo;
  String? name;
  bool isAdmin;
  String? content;
  int? likes;
  int? reply;
  List<Reply?>? replies;
  bool currentUserLikesThread;
  // String? userStatus;

  factory Community.fromJson(Map<String, dynamic> json) => Community(
        id: json["id"],
        title: json["title"] == null ? "" : json["title"],
        date: json["date"] == null ? "" : json["date"],
        image: json["image"] == false ? "" : json["image"],
        timeAgo: json["timeAgo"] == null ? "" : json["timeAgo"],
        name: json["name"] == null ? "" : json["name"],
        isAdmin: json["isAdmin"],
        content: json["content"] == null ? "" : json["content"],
        likes: json["likes"] == null ? 0 : json["likes"],
        reply: json["replies"] is int ? json["replies"] : null,
        // replies: json["replies"] is List ? List<Reply>.from(json["replies"].map((x) => x)) : null,
        currentUserLikesThread: json["currentUserLikesThread"],
        // userStatus: json["userStatus"] == null ? "" : json["userStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date == null ? "" : date,
        "image": image == false ? "" : image,
        "timeAgo": timeAgo == null ? "" : timeAgo,
        "name": name == null ? null : name,
        "isAdmin": isAdmin,
        "content": content == null ? "" : content,
        "likes": likes == null ? 0 : likes,
        "reply": reply == null ? 0 : reply,
        "replies": replies == null ? [] : List<Reply>.from(replies!.map((x) => x)),
        "currentUserLikesThread": currentUserLikesThread,
        // "userStatus": userStatus == "" ? "" : userStatus,
      };
}

class Reply {
  Reply({
    required this.id,
    this.title,
    this.date,
    this.image,
    this.timeAgo,
    this.name,
    required this.isAdmin,
    this.content,
    this.likes,
    this.replies,
    required this.currentUserLikesThread,
    // this.userStatus,
  });

  int id;
  String? title;
  String? date;
  String? image;
  String? timeAgo;
  String? name;
  bool isAdmin;
  String? content;
  int? likes;
  int? replies;
  bool currentUserLikesThread;
  // String? userStatus;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        title: json["title"] == null ? "" : json["title"],
        date: json["date"] == null ? "" : json["date"],
        image: json["image"] == false ? "" : json["image"],
        timeAgo: json["timeAgo"] == null ? "" : json["timeAgo"],
        name: json["name"] == null ? "" : json["name"],
        isAdmin: json["isAdmin"],
        content: json["content"] == null ? "" : json["content"],
        likes: json["likes"],
        replies: json["replies"],
        currentUserLikesThread: json["currentUserLikesThread"],
        // userStatus: json["userStatus"] == null ? "" : json["userStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title == null ? "" : title,
        "date": date == null ? "" : date,
        "image": image == false ? "" : image,
        "timeAgo": timeAgo == null ? "" : timeAgo,
        "name": name == null ? "" : name,
        "isAdmin": isAdmin,
        "content": content == null ? "" : content,
        "likes": likes == null ? 0 : likes,
        "replies": replies == null ? 0 : replies,
        "currentUserLikesThread": currentUserLikesThread,
        // "userStatus": userStatus == null ? "" : userStatus,
      };
}

class Follow {
  Follow({
    required this.type,
    required this.id,
    required this.title,
    required this.image,
    required this.name,
  });

  String type;
  int id;
  String title;
  String image;
  String name;

  factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        type: json["type"],
        id: json["id"],
        title: json["title"],
        image: json["image"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "title": title,
        "image": image,
        "name": name,
      };
}
