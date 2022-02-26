import 'package:flutter/material.dart';

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  State<RatingBox> createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int rating = 0;
  void setrangeAsOne() {
    setState(() {
      rating = 1;
    });
  }

  void setrangeAsTwo() {
    setState(() {
      rating = 2;
    });
  }

  void setrangeAsThree() {
    setState(() {
      rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
    print(rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: setrangeAsOne,
            icon: Icon(
              rating == 1 ? Icons.star : Icons.star_border,
              color: Colors.red[500],
              size: size,
            ),
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: setrangeAsTwo,
            icon: Icon(
              rating == 2 ? Icons.star : Icons.star_border,
              color: Colors.red[500],
              size: size,
            ),
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: setrangeAsThree,
            icon: Icon(
              rating == 3 ? Icons.star : Icons.star_border,
              color: Colors.red[500],
              size: size,
            ),
            iconSize: size,
          ),
        ),
      ],
    );
  }
}
