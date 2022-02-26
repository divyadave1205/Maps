// To parse this JSON data, do
//
//     final singleUserData = singleUserDataFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SingleUserData {
  SingleUserData({
    required this.data,
    required this.support,
  });

  final Data? data;
  final Support? support;

  factory SingleUserData.fromJson(String str) =>
      SingleUserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleUserData.fromMap(Map<String, dynamic> json) => SingleUserData(
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        support:
            json["support"] == null ? null : Support.fromMap(json["support"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data!.toMap(),
        "support": support == null ? null : support!.toMap(),
      };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar == null ? null : avatar,
      };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  final String url;
  final String text;

  factory Support.fromJson(String str) => Support.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Support.fromMap(Map<String, dynamic> json) => Support(
        url: json["url"] == null ? null : json["url"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
        "text": text == null ? null : text,
      };
}
