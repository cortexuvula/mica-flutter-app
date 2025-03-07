import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';

class ClinicalSelect extends StatefulWidget {
  const ClinicalSelect({super.key});
  
  @override
  _ClinicalSelectState createState() => _ClinicalSelectState();
}

class _ClinicalSelectState extends State<ClinicalSelect> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.clinicalSelect_title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => const Welcome());
                Navigator.of(context).pushAndRemoveUntil(
                    router, (Route<dynamic> route) => false);
              })
        ],
      ),
      body: ListView(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: height,
            ),
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(
                            appData.clinicalSelectButton1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(
                            appData.clinicalSelectButton2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(
                            appData.clinicalSelectButton3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(
                            appData.clinicalSelectButton4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
            ),
            SizedBox(
              width: width * 0.9,
              child: Card(
                elevation: 10.0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: width * 0.8,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                            backgroundColor: Theme.of(context).colorScheme.secondary,
                          ),
                          onPressed: () {
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Welcome());
                            Navigator.of(context).pushAndRemoveUntil(
                                router, (Route<dynamic> route) => true);
                          },
                          child: Text(
                            appData.clinicalSelectButton5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   width: _width * 0.9,
            //   child: Card(
            //     elevation: 10.0,
            //     color: Colors.white,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: <Widget>[
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               elevation: 10.0,
            //               backgroundColor: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {
            //               var router = MaterialPageRoute(
            //                   builder: (BuildContext context) => const Welcome());
            //               Navigator.of(context).pushAndRemoveUntil(
            //                   router, (Route<dynamic> route) => true);
            //             },
            //             child: Text(
            //               appData.clinicalSelectButton6,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: _width * 0.9,
            //   child: Card(
            //     elevation: 10.0,
            //     color: Colors.white,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: <Widget>[
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               elevation: 10.0,
            //               backgroundColor: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {
            //               var router = MaterialPageRoute(
            //                   builder: (BuildContext context) => const Welcome());
            //               Navigator.of(context).pushAndRemoveUntil(
            //                   router, (Route<dynamic> route) => true);
            //             },
            //             child: Text(
            //               appData.clinicalSelectButton7,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: _width * 0.9,
            //   child: Card(
            //     elevation: 10.0,
            //     color: Colors.white,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: <Widget>[
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               elevation: 10.0,
            //               backgroundColor: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {
            //               var router = MaterialPageRoute(
            //                   builder: (BuildContext context) => const Welcome());
            //               Navigator.of(context).pushAndRemoveUntil(
            //                   router, (Route<dynamic> route) => true);
            //             },
            //             child: Text(
            //               appData.clinicalSelectButton8,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: _width * 0.9,
            //   child: Card(
            //     elevation: 10.0,
            //     color: Colors.white,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: <Widget>[
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               elevation: 10.0,
            //               backgroundColor: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {
            //               var router = MaterialPageRoute(
            //                   builder: (BuildContext context) => const Welcome());
            //               Navigator.of(context).pushAndRemoveUntil(
            //                   router, (Route<dynamic> route) => true);
            //             },
            //             child: Text(
            //               appData.clinicalSelectButton9,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: _width * 0.9,
            //   child: Card(
            //     elevation: 10.0,
            //     color: Colors.white,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Column(
            //         children: <Widget>[
            //           ElevatedButton(
            //             style: ElevatedButton.styleFrom(
            //               elevation: 10.0,
            //               backgroundColor: Theme.of(context).colorScheme.secondary,
            //             ),
            //             onPressed: () {
            //               var router = MaterialPageRoute(
            //                   builder: (BuildContext context) => const Welcome());
            //               Navigator.of(context).pushAndRemoveUntil(
            //                   router, (Route<dynamic> route) => true);
            //             },
            //             child: Text(
            //               appData.clinicalSelectButton10,
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ]),
    );
  }
}
