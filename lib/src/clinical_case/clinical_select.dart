import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';

class ClinicalSelect extends StatefulWidget {
  @override
  _ClinicalSelectState createState() => _ClinicalSelectState();
}

class _ClinicalSelectState extends State<ClinicalSelect> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.appName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () => debugPrint("info")),
        ],
      ),
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton5,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton7,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton8,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton9,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      RaisedButton(
                        elevation: 10.0,
                        onPressed: () {
                          var router = new MaterialPageRoute(
                              builder: (BuildContext context) => new Welcome());
                          Navigator.of(context).pushAndRemoveUntil(
                              router, (Route<dynamic> route) => true);
                        },
                        child: Text(
                          appData.clinicalSelectButton10,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
