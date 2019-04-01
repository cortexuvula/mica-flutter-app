import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/clinical_case/clinical_select.dart';
import 'package:mica/src/domain_testing/domain_select.dart';
import 'package:mica/src/home.dart';
import 'package:mica/src/resource_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Hero(
                  tag: "logo",
                  child: Image.asset(
                    "./images/logo512.png",
                    height: 50.0,
                    width: 50.0,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: _width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      appData.welcomeTitle,
                      textAlign: TextAlign.center,
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
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Text(appData.welcomeButtonOption1),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(appData.welcomeOption1),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new DomainSelect());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.welcomeButtonOption2),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(appData.welcomeOption2),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new ClinicalSelect());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(appData.welcomeButtonOption3),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(appData.welcomeOption3),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            _launchURL();
                          },
                          child: Text(appData.welcomeButtonOption4),
                        ),
                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        // Text(appData.welcomeOption3),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          elevation: 10.0,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResourcePage()));
                          },
                          child: Text(appData.welcomeButtonOption5),
                        ),
                        // SizedBox(
                        //   height: 5.0,
                        // ),
                        // Text(appData.welcomeOption3),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
        backgroundColor: Theme.of(context).backgroundColor);
  }

  _launchURL() async {
    const url = 'http://neoncortex.net/wp-content/mca/bca.pdf';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
