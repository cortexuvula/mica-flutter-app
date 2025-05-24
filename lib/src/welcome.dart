import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/home.dart';
import 'package:mica/src/resource_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                height: 20.0,
              ),
              Hero(
                  tag: "logo",
                  child: Image.asset(
                    "./images/logo512.png",
                    height: 50.0,
                    width: 50.0,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      app_data.welcomeTitle.toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateTo(
                                context,
                                const Home(),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.welcomeButtonOption1,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    app_data.welcomeOption1,
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   width: width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.white,
              //     child: Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: Column(
              //         children: <Widget>[
              //           SizedBox(
              //             width: width * 0.8,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 elevation: 10.0,
              //                 backgroundColor:
              //                     Theme.of(context).colorScheme.secondary,
              //               ),
              //               onPressed: () {
              //                 var router = MaterialPageRoute(
              //                     builder: (BuildContext context) =>
              //                         const DomainSelect());
              //                 Navigator.of(context).pushAndRemoveUntil(
              //                     router, (Route<dynamic> route) => true);
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   children: <Widget>[
              //                     Text(appData.welcomeButtonOption2),
              //                     const SizedBox(
              //                       height: 5.0,
              //                     ),
              //                     Text(
              //                       app_data.welcomeOption2,
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.white,
              //     child: Padding(
              //       padding: const EdgeInsets.all(20.0),
              //       child: Column(
              //         children: <Widget>[
              //           SizedBox(
              //             width: width * 0.8,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 elevation: 10.0,
              //                 backgroundColor: Theme.of(context).colorScheme.secondary,
              //               ),
              //               onPressed: () {
              //                 var router = MaterialPageRoute(
              //                     builder: (BuildContext context) =>
              //                         const ClinicalSelect());
              //                 Navigator.of(context).pushAndRemoveUntil(
              //                     router, (Route<dynamic> route) => true);
              //               },
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   children: <Widget>[
              //                     Text(appData.welcomeButtonOption3),
              //                     const SizedBox(
              //                       height: 5.0,
              //                     ),
              //                     Text(
              //                       app_data.welcomeOption3,
              //                       textAlign: TextAlign.center,
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              _launchURL();
                            },
                            child: Text(app_data.welcomeButtonOption4,
                                style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: width * 0.8,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 10.0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                            onPressed: () {
                              NavigationHelper.navigateTo(
                                context,
                                ResourcePage(),
                              );
                            },
                            child: Text(
                              app_data.welcomeButtonOption5,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ]),
        backgroundColor: Theme.of(context).colorScheme.surface);
  }

  _launchURL() async {
    final Uri url = Uri.parse('/assets/bca.pdf');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
