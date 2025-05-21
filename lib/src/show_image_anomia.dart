import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;

class ShowImageAnomia extends StatefulWidget {
  final String imageURL;
  final int imageNumber;

  const ShowImageAnomia(
      {super.key, required this.imageURL, required this.imageNumber});

  @override
  ShowImageAnomiaState createState() => ShowImageAnomiaState();
}

class ShowImageAnomiaState extends State<ShowImageAnomia> {
  late int image1;
  late int image2;
  late int image3;
  late int image4;

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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: PageView(
          children: <Widget>[
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURL[widget.imageNumber],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURL[image1],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURL[image2],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURL[image3],
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: Image.asset(
                app_data.imageURL[image4],
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ));
  }
}
