// ignore_for_file: prefer_const_constructors
// ignore_for_file:prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:maps/APIS/API1/product_page.dart';

import 'model/employee_data_model.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, this.item}) : super(key: key);
  final Datum? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(item!.profileImage),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item!.employeeName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item!.employeeAge.toString()),
                    Text("Price:" + item!.employeeSalary.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductBoxList extends StatelessWidget {
  final EmployeeData? items;
  const ProductBoxList({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items?.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(
                  item: items!.data[index],
                ),
              ),
            );
          },
          child: ProductBox(
            item: items!.data[index],
          ),
        );
      },
    );
  }
}
