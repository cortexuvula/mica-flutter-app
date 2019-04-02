import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;

class ShowImageAnomia extends StatefulWidget {
  String imageURL;
  int imageNumber;

  ShowImageAnomia({Key key, this.imageURL, this.imageNumber}) : super(key: key);

  @override
  _ShowImageAnomiaState createState() => _ShowImageAnomiaState();
}

class _ShowImageAnomiaState extends State<ShowImageAnomia> {
  int image1;
  int image2;
  int image3;
  int image4;

  @override
  Widget build(BuildContext context) {
    switch (widget.imageNumber) {
      case 0:
        {
          image1 = 1;
          image2 = 2;
          image3 = 3;
          image4 = 4;
          break;
        }
      case 1:
        {
          image1 = 0;
          image2 = 2;
          image3 = 3;
          image4 = 4;
          break;
        }
      case 2:
        {
          image1 = 0;
          image2 = 1;
          image3 = 3;
          image4 = 4;
          break;
        }
      case 3:
        {
          image1 = 0;
          image2 = 1;
          image3 = 2;
          image4 = 4;
          break;
        }
      case 4:
        {
          image1 = 0;
          image2 = 1;
          image3 = 2;
          image4 = 3;
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
                appData.imageURL[widget.imageNumber],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURL[image1],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURL[image2],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURL[image3],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Image.asset(
                appData.imageURL[image4],
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ));
  }
}
