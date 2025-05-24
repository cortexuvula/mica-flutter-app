import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';

import 'domain_attention_concentration.dart';

class SerialSeven extends StatefulWidget {
  const SerialSeven({super.key});

  @override
  DomainSerialSevenState createState() => DomainSerialSevenState();
}

class DomainSerialSevenState extends State<SerialSeven> {
  double sizeBoxHeight = 10.0;
  int _radioValue = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            app_data.domainSerialTitle,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   app_data.domain_attention_subtitle,
          //   style: TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.w500,
          //       fontSize: 15.0),
          //   textAlign: TextAlign.start,
          // ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                NavigationHelper.navigateAndRemoveUntil(
                  context,
                  Welcome(),
                  (Route<dynamic> route) => false,
                );
              })
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: sizeBoxHeight,
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
                        Text(
                          "Serial 7's",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.0),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialSevenPatient,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialSevenExaminer,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialSevenPatient2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
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
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.yellowAccent.shade400,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialSevenPatient,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.deepPurple.shade300,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialSevenExaminer,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.yellowAccent.shade400,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialSevenPatient2,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: sizeBoxHeight,
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
                        Text(
                          "Serial 3's",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.0),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialThreePatient,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.deepPurple.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialThreeExaminer,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                        SizedBox(
                          width: width * 0.9,
                          child: Card(
                            elevation: 10.0,
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.domainSerialThreePatient2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.0),
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
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.yellowAccent.shade400,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialThreePatient,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.deepPurple.shade300,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialThreeExaminer,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: sizeBoxHeight,
              // ),
              // Container(
              //   width: _width * 0.9,
              //   child: Card(
              //     elevation: 10.0,
              //     color: Colors.yellowAccent.shade400,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             app_data.domainSerialThreePatient2,
              //             textAlign: TextAlign.center,
              //             style: TextStyle(
              //                 color: Colors.black,
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 15.0),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        // Text(
                        //   app_data.testAttentionResponse,
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 15.0),
                        // ),
                        Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          border: TableBorder.all(),
                          columnWidths: {
                            0: FlexColumnWidth(0.3),
                            1: FlexColumnWidth(0.3),
                            2: FlexColumnWidth(0.34)
                          },
                          children: [
                            TableRow(children: [
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) =>
                                        _handleRadioValueChange(value ?? 0),
                                    activeColor: Colors.white,
                                  ),
                                  Text(
                                    "Normal",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) =>
                                        _handleRadioValueChange(value ?? 0),
                                    activeColor: Colors.white,
                                  ),
                                  Text(
                                    "Equivocal",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 2,
                                    groupValue: _radioValue,
                                    onChanged: (int? value) =>
                                        _handleRadioValueChange(value ?? 0),
                                    activeColor: Colors.white,
                                  ),
                                  Text(
                                    "Impaired",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ],
                              )
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  app_data.testAttentionResponseNormal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  app_data.testAttentionResponseEquivocal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  app_data.testAttentionResponseImpaired,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeBoxHeight,
              ),
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10.0,
                      ),
                      onPressed: () {
                        NavigationHelper.navigateAndRemoveUntil(
                          context,
                          AttentionConcentration(),
                          (Route<dynamic> route) => true,
                        );
                      },
                      child: Text(app_data.domainTestCompleteButton),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
}
