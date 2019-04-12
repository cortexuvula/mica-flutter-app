import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/domain_testing/domain_attention_concentration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mica/src/welcome.dart';

class DomainSelect extends StatefulWidget {
  @override
  _DomainSelectState createState() => _DomainSelectState();
}

class _DomainSelectState extends State<DomainSelect> {
  @override
  void initState() {
    super.initState();
    saveInitialData();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    double _height = 10.0;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.domain_select,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) => new Welcome());
                Navigator.of(context).pushAndRemoveUntil(
                    router, (Route<dynamic> route) => false);
              })
        ],
      ),
      body: ListView(children: <Widget>[
        Column(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          appData.domain_select_info.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new AttentionConcentration());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height,
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
                      Container(
                        width: _width * 0.8,
                        child: RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.domainSelectButton6),
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

  void saveInitialData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Vigilance
    prefs.setInt("domain_attention", 0);
    prefs.setInt("domain_correctTap", 0);
    prefs.setInt("domain_wrongTap", 0);

    List<String> letterTapButtonColor = [];

    List<String> tapCorrect = [];
    List<String> tapWrong = [];
    List<String> correctCheck = [];

    for (var i = 0; i < 26; i++) {
      tapCorrect.add("false");
      tapWrong.add("false");
      correctCheck.add("false");
      letterTapButtonColor.add("cyan");
    }

    prefs.setStringList("domain_letterTapButtonColor", letterTapButtonColor);
    prefs.setStringList("domain_tapCorrect", tapCorrect);
    prefs.setStringList("domain_tapWrong", tapWrong);
    prefs.setStringList("domain_correctCheck", correctCheck);
  }
}
