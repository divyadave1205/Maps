// To parse this JSON data, do
//
//     final userData = userDataFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, prefer_null_aware_operators

import 'package:meta/meta.dart';
import 'dart:convert';

class UserData {
  UserData({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Datum> data;
  final Support? support;

  factory UserData.fromJson(String str) => UserData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        total: json["total"] == null ? null : json["total"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        support: json["support"] == null
            ? null
            : Support.fromMap(
                json["support"],
              ),
      );

  Map<String, dynamic> toMap() => {
        "page": page == null ? null : page,
        "per_page": perPage == null ? null : perPage,
        "total": total == null ? null : total,
        "total_pages": totalPages == null ? null : totalPages,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "support": support == null ? null : support!.toMap(),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
