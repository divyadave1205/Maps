// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Login {
  Login({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Datum> data;
  final Support? support;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        total: json["total"] == null ? null : json["total"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        support:
            json["support"] == null ? null : Support.fromMap(json["support"]),
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
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        year: json["year"] == null ? null : json["year"],
        color: json["color"] == null ? null : json["color"],
        pantoneValue:
            json["pantone_value"] == null ? null : json["pantone_value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "year": year == null ? null : year,
        "color": color == null ? null : color,
        "pantone_value": pantoneValue == null ? null : pantoneValue,
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
