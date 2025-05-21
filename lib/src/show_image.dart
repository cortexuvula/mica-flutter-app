import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;

class ShowImage extends StatefulWidget {
  final String imageURL;
  final int imageNumber;

  const ShowImage(
      {super.key, required this.imageURL, required this.imageNumber});

  @override
  ShowImageState createState() => ShowImageState();
}

class ShowImageState extends State<ShowImage> {
  late int image1;
  late int image2;

  @override
  Widget build(BuildContext context) {
    switch (widget.imageNumber) {
      case 0:
        {
          image1 = 1;
          image2 = 2;
          break;
        }
      case 1:
        {
          image1 = 0;
          image2 = 2;
          break;
        }
      case 2:
        {
          image1 = 0;
          image2 = 1;
          break;
        }
    }
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: PageView(
          children: <Widget>[
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURLPraxis[widget.imageNumber],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURLPraxis[image1],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURLPraxis[image2],
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ));
  }
}
