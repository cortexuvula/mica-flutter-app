import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/welcome.dart';

import 'domain_attention_concentration.dart';

class Digit extends StatefulWidget {
  const Digit({super.key});

  @override
  _DigitState createState() => _DigitState();
}

class _DigitState extends State<Digit> {
  double sizeBoxHeight = 10.0;
  int _radioValue = 2;

  bool number1 = false;
  bool number2 = false;
  bool number3 = false;
  bool number4 = false;

  int correctCount = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            appData.domain_digit_title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
          // subtitle: Text(
          //   appData.domain_attention_subtitle,
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
                var router = MaterialPageRoute(
                    builder: (BuildContext context) => Welcome());
                Navigator.of(context).pushAndRemoveUntil(
                    router, (Route<dynamic> route) => false);
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
                  color: Colors.yellowAccent.shade400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          appData.domain_digit_patient,
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
                          appData.domain_digit_examiner,
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
                    child: ListTile(
                      title: Text(
                        appData.domain_digit_numbers1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      subtitle: Text(
                        appData.domain_digit_numbers1_sub,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box),
                        color: number1 ? Colors.green : Colors.black,
                        onPressed: () {
                          setState(() {
                            changeRadio(number1);
                            number1 = !number1;
                          });
                        },
                      ),
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
                    child: ListTile(
                      title: Text(
                        appData.domain_digit_numbers2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      subtitle: Text(
                        appData.domain_digit_numbers2_sub,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box),
                        color: number2 ? Colors.green : Colors.black,
                        onPressed: () {
                          setState(() {
                            changeRadio(number2);
                            number2 = !number2;
                          });
                        },
                      ),
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
                    child: ListTile(
                      title: Text(
                        appData.domain_digit_numbers3,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      subtitle: Text(
                        appData.domain_digit_numbers3_sub,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box),
                        color: number3 ? Colors.green : Colors.black,
                        onPressed: () {
                          setState(() {
                            changeRadio(number3);
                            number3 = !number3;
                          });
                        },
                      ),
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
                    child: ListTile(
                      title: Text(
                        appData.domain_digit_numbers4,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      subtitle: Text(
                        appData.domain_digit_numbers4_sub,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.0),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.check_box),
                        color: number4 ? Colors.green : Colors.black,
                        onPressed: () {
                          setState(() {
                            changeRadio(number4);
                            number4 = !number4;
                          });
                        },
                      ),
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
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        // Text(
                        //   appData.testAttentionResponse,
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
                                    onChanged: _handleRadioValueChange,
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
                                    onChanged: _handleRadioValueChange,
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
                                    onChanged: _handleRadioValueChange,
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
                                  appData.testAttentionResponseNormal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  appData.testAttentionResponseEquivocal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  appData.testAttentionResponseImpaired,
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
                        var router = MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AttentionConcentration());
                        Navigator.of(context).pushAndRemoveUntil(
                            router, (Route<dynamic> route) => true);
                      },
                      child: Text(appData.domain_test_complete_button),
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

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value ?? 2; // Default to 2 if null
    });
  }

  void changeRadio(bool number) {
    if (!number) {
      setState(() {
        correctCount += 1;
      });
    } else {
      setState(() {
        correctCount -= 1;
      });
    }
    if (correctCount == 3) {
      setState(() {
        _radioValue = 1;
      });
    } else if (correctCount == 4) {
      setState(() {
        _radioValue = 0;
      });
    } else {
      setState(() {
        _radioValue = 2;
      });
    }
  }
}
