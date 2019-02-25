import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {

  String imageURL;

  ShowImage(
      {Key key,
        this.imageURL,
        })
      : super(key: key);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.clear),
//              onPressed: () {
//                Navigator.pop(context);
//              })
//        ],
      ),
      body: Center(
        child: Container(
          width: _width * 0.9,
          child: Image.asset(
              widget.imageURL,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
