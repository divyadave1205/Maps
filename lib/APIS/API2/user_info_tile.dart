// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:maps/APIS/API2/user_data.dart';
import 'package:maps/APIS/API2/user_info_page.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({Key? key, this.item}) : super(key: key);
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
            Image.network(item!.avatar),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item!.firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item!.id.toString(),
                    ),
                    Text(item!.lastName),
                    Text(item!.email),
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

class UserInfoTileList extends StatelessWidget {
  final UserData? items;
  const UserInfoTileList({Key? key, this.items}) : super(key: key);

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
                builder: (context) => UserInfoPage(
                  item: items!.data[index],
                ),
              ),
            );
          },
          child: UserInfoTile(
            item: items!.data[index],
          ),
        );
      },
    );
  }
}
