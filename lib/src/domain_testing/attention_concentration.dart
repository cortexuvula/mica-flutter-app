import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';

class AttentionConcentration extends StatefulWidget {
  @override
  _AttentionConcentrationState createState() => _AttentionConcentrationState();
}

class _AttentionConcentrationState extends State<AttentionConcentration> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          appData.attentionConcentrationButton1,
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
                          appData.attentionConcentrationButton2,
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
                          appData.attentionConcentrationButton3,
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
                          appData.attentionConcentrationButton4,
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
                          appData.attentionConcentrationButton5,
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
      ),
    );
  }
}
