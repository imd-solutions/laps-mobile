import 'dart:convert';

WpData wpDataFromJson(String str) => WpData.fromJson(json.decode(str));

String wpDataToJson(WpData data) => json.encode(data.toJson());

class WpData {
  String id;
  String name;
  String? data;

  WpData({
    required this.id,
    required this.name,
    this.data,
  });

  factory WpData.fromJson(Map<String, dynamic> json) => WpData(
    id: json["id"],
    name: json["name"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "data": data,
  };
}