// To parse this JSON data, do
//
//     final employeeData = employeeDataFromMap(jsonString);

// ignore_for_file: unnecessary_null_comparison, prefer_if_null_operators

import 'package:meta/meta.dart';
import 'dart:convert';

class EmployeeData {
  EmployeeData({
    required this.status,
    required this.data,
    required this.message,
  });

  final String status;
  final List<Datum> data;
  final String message;

  factory EmployeeData.fromJson(String str) =>
      EmployeeData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EmployeeData.fromMap(Map<String, dynamic> json) => EmployeeData(
        status: json["status"] == null ? null : json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message == null ? null : message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;
  final String profileImage;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        employeeName:
            json["employee_name"] == null ? null : json["employee_name"],
        employeeSalary:
            json["employee_salary"] == null ? null : json["employee_salary"],
        employeeAge: json["employee_age"] == null ? null : json["employee_age"],
        profileImage:
            json["profile_image"] == null ? null : json["profile_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "employee_name": employeeName == null ? null : employeeName,
        "employee_salary": employeeSalary == null ? null : employeeSalary,
        "employee_age": employeeAge == null ? null : employeeAge,
        "profile_image": profileImage == null ? null : profileImage,
      };
}
