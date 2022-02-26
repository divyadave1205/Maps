import 'package:flutter/material.dart';
import 'package:maps/APIS/API2/user_data.dart';

class UserInfoPage extends StatelessWidget {
  final Datum? item;
  const UserInfoPage({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item!.firstName),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(item!.avatar),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        item!.firstName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(item!.id.toString()),
                      Text(item!.lastName),
                      Text(item!.email),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
