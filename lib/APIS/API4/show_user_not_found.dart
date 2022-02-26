// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:maps/APIS/API4/single_user_not_found_tile.dart';
import 'package:maps/APIS/API4/user_not_found_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

SingleUserNotFoundData users(String responseBody) {
  final code = json.decode(responseBody).cast<Map<String, dynamic>>();
  return code
      .map<SingleUserNotFoundData>(
          (json) => SingleUserNotFoundData.fromJson(json))
      .toList();
}

Future<Widget> fethSingleUserNotFoundDetails() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/users/23"));
  print(response.statusCode);
  if (response.statusCode == 404) {
    return Text("Error 404 : User Details Not Found");
  } else {
    throw Exception("Unable to fetch data from API");
  }
}  

class SingleUsersNotFoundData extends StatelessWidget {
  const SingleUsersNotFoundData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Center(
        child: FutureBuilder<Widget>(
          future: fethSingleUserNotFoundDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? snapshot.requireData
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
