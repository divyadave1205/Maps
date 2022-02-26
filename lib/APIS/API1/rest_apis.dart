// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maps/APIS/API1/product_box.dart';

import 'model/employee_data_model.dart';

EmployeeData parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<EmployeeData>((json) => EmployeeData.fromJson(json))
      .toList();
}

Future<EmployeeData> fetchProducts() async {
  final response = await http.get(
    Uri.parse('http://dummy.restapiexample.com/api/v1/employees'),
  );
  if (response.statusCode == 200) {
    return EmployeeData.fromJson(response.body);
  } else {
    throw Exception("Unable to fetch products from REST API");
  }
}

class RestApi extends StatelessWidget {
  const RestApi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Navigation"),
      ),
      body: Center(
        child: FutureBuilder<EmployeeData>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ProductBoxList(items: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
