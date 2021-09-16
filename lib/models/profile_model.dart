// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.displayEmail,
    this.image,
  });

  int id;
  String firstName;
  String lastName;
  String displayEmail;
  String? image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        displayEmail: json["DisplayEmail"],
        image: json["Image"] != null ? json["Image"] : "",
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "DisplayEmail": displayEmail,
        "Image": image,
      };
}
