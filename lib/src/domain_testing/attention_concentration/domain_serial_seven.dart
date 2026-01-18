import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/resources/strings/attention_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

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
            AttentionStrings.serialTitle,
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
                          AttentionStrings.serialSevenHeader,
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
                                    AttentionStrings.serialSevenPatientInstruction,
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
                                    AttentionStrings.serialSevenExaminerInstruction,
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
                                    AttentionStrings.serialSevenPatientInstruction2,
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
                          AttentionStrings.serialThreeHeader,
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
                                    AttentionStrings.serialThreePatientInstruction,
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
                                    AttentionStrings.serialThreeExaminerInstruction,
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
                                    AttentionStrings.serialThreePatientInstruction2,
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
                        RadioGroup<int>(
                          groupValue: _radioValue,
                          onChanged: (int? value) =>
                              _handleRadioValueChange(value ?? 0),
                          child: Table(
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
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.normal,
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
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.equivocal,
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
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.impaired,
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
                                  AttentionStrings.vigilanceResponseNormal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AttentionStrings.vigilanceResponseEquivocal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AttentionStrings.vigilanceResponseImpaired,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
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
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        CommonStrings.taskCompleted,
                        style: TextStyle(color: Colors.black),
                      ),
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
