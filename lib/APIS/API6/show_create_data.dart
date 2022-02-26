import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maps/APIS/API6/create_data.dart';
import 'package:maps/APIS/API6/create_data_tile.dart';

Login users(String responseBody) {
  final code = json.decode(responseBody).cast<Map<String, dynamic>>();
  return code.map<Login>((json) => Login.fromJson(json)).toList();
}

Future<Login> fethSingleUserDetails(
  int id,
  String firstName,
  String lastName,
  String avtar,
  String email,
) async {
  final response = await http.post(
    Uri.parse("https://reqres.in/api/login"),
    headers: <String, String>{
      HttpHeaders.contentTypeHeader: "application/json"
    },
    body: jsonEncode({
      "email": "eve.holt@reqres.in",
      "password": "pistol",
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return Login.fromJson(response.body);
  } else {
    throw Exception("Unable to fetch data from API");
  }
}

class CreatesData extends StatelessWidget {
  const CreatesData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Center(
        child: FutureBuilder<Login>(
          future: fethSingleUserDetails(1, "", "", "", ""),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? CreateDataTileList(
                    items: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
