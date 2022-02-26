// To parse this JSON data, do
//
//     final singleUserData = singleUserDataFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SingleUserNotFoundData {
  SingleUserNotFoundData();

  factory SingleUserNotFoundData.fromJson(String str) =>
      SingleUserNotFoundData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SingleUserNotFoundData.fromMap(Map<String, dynamic> json) =>
      SingleUserNotFoundData();

  Map<String, dynamic> toMap() => {};
}
