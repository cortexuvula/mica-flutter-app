import 'package:flutter/material.dart';
import 'package:mica/src/pdf_screen.dart';
import 'package:mica/src/resource_page.dart';

class ResourceVideoPDF extends StatefulWidget {
  @override
  _ResourceVideoPDFState createState() => _ResourceVideoPDFState();
}

class _ResourceVideoPDFState extends State<ResourceVideoPDF> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Video & PDF Resources",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PDFScreen()));
                    },
                    child: Text("Written Instructions"),
                  ),
                ),
              ),
            ),
            Container(
              width: _width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    elevation: 10.0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResourcePage()));
                    },
                    child: Text("Video Resources"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
