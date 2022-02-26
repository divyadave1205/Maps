import 'package:flutter/material.dart';
import 'package:maps/APIS/API6/create_data.dart';
import 'package:maps/APIS/API6/create_data_page.dart';

class CreateDataTile extends StatelessWidget {
  const CreateDataTile({Key? key, this.item}) : super(key: key);
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
            Image.network(item!.color),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      item!.id.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item!.name,
                    ),
                    Text(item!.pantoneValue),
                    Text(item!.year.toString()),
                    Text(item!.id.toString()),
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

class CreateDataTileList extends StatelessWidget {
  final Login? items;
  const CreateDataTileList({Key? key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items!.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateDataPage(
                  item: items!.data[index],
                ),
              ),
            );
          },
          child: CreateDataTile(
            item: items!.data[index],
          ),
        );
      },
    );
  }
}
