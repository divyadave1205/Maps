import 'package:flutter/material.dart';
import 'package:maps/APIS/API3/single_user_data.dart';
import 'package:maps/APIS/API3/single_user_info_page.dart';

class SingleUserInfoTile extends StatelessWidget {
  const SingleUserInfoTile({Key? key, this.item}) : super(key: key);
  final Data? item;

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

class SingleUserInfoTileList extends StatelessWidget {
  final SingleUserData? items;
  const SingleUserInfoTileList({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleUserInfoPage(
                  item: items!.data,
                ),
              ),
            );
          },
          child: SingleUserInfoTile(
            item: items!.data,
          ),
        );
      },
    );
  }
}
