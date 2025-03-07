import 'package:flutter/material.dart';
import 'package:mica/src/attention.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/show_image.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisuospatialPraxis extends StatefulWidget {
  final String? patientName;
  final String? assessorName;
  final String? handedness;
  final DateTime? assessmentDate;
  final int? languageComprehensionRadioValue;
  final int? trialOneScore;
  final int? trialTwoScore;
  final int? trialThreeScore;

  const VisuospatialPraxis({
    super.key,
    this.patientName,
    this.assessorName,
    this.handedness,
    this.assessmentDate,
    this.languageComprehensionRadioValue,
    this.trialOneScore,
    this.trialTwoScore,
    this.trialThreeScore,
  });

  @override
  _VisuospatialPraxisState createState() => _VisuospatialPraxisState();
}

class _VisuospatialPraxisState extends State<VisuospatialPraxis> {
  double sizeBoxHeight = 5.0;
  int? _radioValueImageOne;
  int? _radioValueImageTwo;
  int? _radioValueImageThree;

  int imageNumber = 0;

  String displayImage = appData.imageURLPraxis[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double fontSize = 8.0;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await savePrefData();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              appData.testVisuospatialPraxis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              appData.testVisuospatialPraxisSubtitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                var router = MaterialPageRoute(
                  builder: (BuildContext context) => const Welcome(),
                );
                Navigator.of(context).pushAndRemoveUntil(
                  router,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
        body: PageView(
          children: <Widget>[
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Column(
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
                                    appData.testVisuospatialPraxisDetails,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
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
                            color: Colors.yellowAccent.shade400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    appData.testVisuospatialPraxisToPatient,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              iconSize: 40.0,
                              onPressed: backButtonActive
                                  ? () {
                                      print("tapped");
                                      if (imageNumber > 0) {
                                        setState(() {
                                          imageNumber -= 1;
                                          displayImage =
                                              appData.imageURLPraxis[imageNumber];
                                        });
                                      }
                                      if (imageNumber == 0) {
                                        setState(() {
                                          backButtonActive = false;
                                        });
                                      }
                                      if (imageNumber < 2) {
                                        setState(() {
                                          forwardButtonActive = true;
                                        });
                                      }
                                    }
                                  : null,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowImage(
                                      imageURL:
                                          appData.imageURLPraxis[imageNumber],
                                      imageNumber: imageNumber,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    displayImage,
                                    width: width / 2,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 40.0,
                              onPressed: forwardButtonActive
                                  ? () {
                                      if (imageNumber < 2) {
                                        setState(() {
                                          imageNumber += 1;
                                          displayImage =
                                              appData.imageURLPraxis[imageNumber];
                                        });
                                      }
                                      if (imageNumber == 2) {
                                        setState(() {
                                          forwardButtonActive = false;
                                        });
                                      }
                                      if (imageNumber > 0) {
                                        setState(() {
                                          backButtonActive = true;
                                        });
                                      }
                                    }
                                  : null,
                            ),
                          ],
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    appData.testVisuospatialPraxisScoring,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeBoxHeight,
                                  ),
                                  Text(
                                    "Image One",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: sizeBoxHeight,
                                  ),
                                  Table(
                                    border: TableBorder.all(),
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    columnWidths: {
                                      0: const FlexColumnWidth(0.2),
                                      1: const FlexColumnWidth(0.2),
                                      2: const FlexColumnWidth(0.2),
                                      3: const FlexColumnWidth(0.2),
                                      4: const FlexColumnWidth(0.2),
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "No Mistakes",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Few Omissions",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Poor",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "No Drawing",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: fontSize,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image 1",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 0,
                                                groupValue: _radioValueImageOne,
                                                onChanged: _handleRadioValueChange1,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "3",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 1,
                                                groupValue: _radioValueImageOne,
                                                onChanged: _handleRadioValueChange1,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "2",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 2,
                                                groupValue: _radioValueImageOne,
                                                onChanged: _handleRadioValueChange1,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 3,
                                                groupValue: _radioValueImageOne,
                                                onChanged: _handleRadioValueChange1,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image 2",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 0,
                                                groupValue: _radioValueImageTwo,
                                                onChanged: _handleRadioValueChange2,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "3",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 1,
                                                groupValue: _radioValueImageTwo,
                                                onChanged: _handleRadioValueChange2,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "2",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 2,
                                                groupValue: _radioValueImageTwo,
                                                onChanged: _handleRadioValueChange2,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 3,
                                                groupValue: _radioValueImageTwo,
                                                onChanged: _handleRadioValueChange2,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Image 3",
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 0,
                                                groupValue: _radioValueImageThree,
                                                onChanged: _handleRadioValueChange3,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "3",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 1,
                                                groupValue: _radioValueImageThree,
                                                onChanged: _handleRadioValueChange3,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "2",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 2,
                                                groupValue: _radioValueImageThree,
                                                onChanged: _handleRadioValueChange3,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Radio(
                                                value: 3,
                                                groupValue: _radioValueImageThree,
                                                onChanged: _handleRadioValueChange3,
                                                activeColor: Colors.white,
                                              ),
                                              Text(
                                                "0",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.secondary,
                                      elevation: 10.0,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Attention(
                                            patientName: widget.patientName,
                                            assessorName: widget.assessorName,
                                            handedness: widget.handedness,
                                            assessmentDate: widget.assessmentDate,
                                            languageComprehensionRadioValue:
                                                widget.languageComprehensionRadioValue,
                                            trialOneScore: widget.trialOneScore,
                                            trialTwoScore: widget.trialTwoScore,
                                            trialThreeScore:
                                                widget.trialThreeScore,
                                            visuospatialPraxisImage1:
                                                _radioValueImageOne,
                                            visuospatialPraxisImage2:
                                                _radioValueImageTwo,
                                            visuospatialPraxisImage3:
                                                _radioValueImageThree,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text("Continue"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeBoxHeight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValueImageOne = value;
    });
  }

  void _handleRadioValueChange2(int? value) {
    setState(() {
      _radioValueImageTwo = value;
    });
  }

  void _handleRadioValueChange3(int? value) {
    setState(() {
      _radioValueImageThree = value;
    });
  }

  Future<bool> savePrefData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("visuospatialPraxisImage1", _radioValueImageOne ?? 0);
    prefs.setInt("visuospatialPraxisImage2", _radioValueImageTwo ?? 0);
    prefs.setInt("visuospatialPraxisImage3", _radioValueImageThree ?? 0);

    return true;
  }

  void getPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _radioValueImageOne = prefs.getInt("visuospatialPraxisImage1") ?? 0;
      _radioValueImageTwo = prefs.getInt("visuospatialPraxisImage2") ?? 0;
      _radioValueImageThree = prefs.getInt("visuospatialPraxisImage3") ?? 0;
    });
  }
}
