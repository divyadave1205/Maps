import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maps/APIS/API5/list_resource_data.dart';
import 'package:http/http.dart' as http;
import 'package:maps/APIS/API5/list_resource_tile.dart';

ListResource users(String responseBody) {
  final code = json.decode(responseBody).cast<Map<String, dynamic>>();
  return code.map<ListResource>((json) => ListResource.fromJson(json)).toList();
}

Future<ListResource> fethSingleUserDetails() async {
  final response = await http.get(Uri.parse("https://reqres.in/api/unknown/2"));
  if (response.statusCode == 200) {
    return ListResource.fromJson(response.body);
  } else {
    throw Exception("Unable to fetch data from API");
  }
}

class ListResources extends StatelessWidget {
  const ListResources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Information"),
      ),
      body: Center(
        child: FutureBuilder<ListResource>(
          future: fethSingleUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ListResourceTileList(
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
