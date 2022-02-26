import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:maps/APIS/API2/user_info_tile.dart';
import 'package:maps/APIS/API2/user_data.dart';

UserData users(String responseBody) {
  final code = json.decode(responseBody).cast<Map<String, dynamic>>();
  return code.map<UserData>((json) => UserData.fromJson(json)).toList();
}

Future<UserData> fethDetails() async {
  final response =
      await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
  if (response.statusCode == 200) {
    return UserData.fromJson(response.body);
  } else {
    throw Exception("Unable to fetch data from API");
  }
}

class UsersData extends StatelessWidget {
  const UsersData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Center(
        child: FutureBuilder<UserData>(
          future: fethDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? UserInfoTileList(
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
