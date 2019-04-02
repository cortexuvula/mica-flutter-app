import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;

class ShowImage extends StatefulWidget {
  String imageURL;
  int imageNumber;

  ShowImage({Key key, this.imageURL, this.imageNumber}) : super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  int image1;
  int image2;

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

    print("This is the image ${widget.imageNumber}");
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: PageView(
          children: <Widget>[
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURLPraxis[widget.imageNumber],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURLPraxis[image1],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURLPraxis[image2],
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ));
  }
}
