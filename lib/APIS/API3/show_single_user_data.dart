import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maps/APIS/API3/single_user_data.dart';
import 'package:http/http.dart' as http;
import 'package:maps/APIS/API3/single_user_info_tile.dart';

SingleUserData users(String responseBody) {
  final code = json.decode(responseBody).cast<Map<String, dynamic>>();
  return code
      .map<SingleUserData>((json) => SingleUserData.fromJson(json))
      .toList();
}

Future<SingleUserData> fethSingleUserDetails() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
  if (response.statusCode == 200) {
    return SingleUserData.fromJson(response.body);
  } else {
    throw Exception("Unable to fetch data from API");
  }
}

class SingleUsersData extends StatelessWidget {
  const SingleUsersData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Center(
        child: FutureBuilder<SingleUserData>(
          future: fethSingleUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? SingleUserInfoTileList(
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
