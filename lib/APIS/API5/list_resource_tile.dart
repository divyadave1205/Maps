import 'package:flutter/material.dart';
import 'package:maps/APIS/API5/list_resorce_page.dart';
import 'package:maps/APIS/API5/list_resource_data.dart';

class ListResourceTile extends StatelessWidget {
  const ListResourceTile({Key? key, this.item}) : super(key: key);
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
            Text(item!.id.toString()),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item!.color,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item!.year.toString(),
                    ),
                    Text(item!.pantoneValue),
                    Text(item!.name),
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

class ListResourceTileList extends StatelessWidget {
  final ListResource? items;
  const ListResourceTileList({Key? key, this.items}) : super(key: key);

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
                builder: (context) => ListResourcePage(
                  item: items!.data,
                ),
              ),
            );
          },
          child: ListResourceTile(
            item: items!.data,
          ),
        );
      },
    );
  }
}
