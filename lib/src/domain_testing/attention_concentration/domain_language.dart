import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/resources/strings/attention_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class DomainLanguage extends StatefulWidget {
  const DomainLanguage({super.key});

  @override
  DomainLanguageState createState() => DomainLanguageState();
}

class DomainLanguageState extends State<DomainLanguage> {
  var format = DateFormat.yMMMMd();
  int _radioValue = 0;
  double sizeBoxHeight = 10.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // Remove unused variable
    //var sizeBoxWidth = (_width * 0.8) / 3;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            AttentionStrings.observationTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            AttentionStrings.observationSubtitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                            AttentionStrings.observationExaminerInstruction,
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
                          Text(
                            AttentionStrings.observationResponseInstruction,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          RadioGroup<int>(
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                            child: Table(
                              border: TableBorder.all(),
                              columnWidths: {
                                0: FlexColumnWidth(0.33),
                                1: FlexColumnWidth(0.33),
                                2: FlexColumnWidth(0.34),
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
                                            color: Colors.black, fontSize: 10.0),
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
                                            color: Colors.black, fontSize: 10.0),
                                        overflow: TextOverflow.ellipsis,
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
                                            color: Colors.black, fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ]),
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
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
  }
}
