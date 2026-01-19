import 'package:flutter/material.dart';
import 'package:mica/src/attention.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/show_image.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';

class VisuospatialPraxis extends StatefulWidget {
  const VisuospatialPraxis({super.key});

  @override
  VisuospatialPraxisState createState() => VisuospatialPraxisState();
}

class VisuospatialPraxisState extends State<VisuospatialPraxis> {
  double sizeBoxHeight = 5.0;
  int? _radioValueImageOne;
  int? _radioValueImageTwo;
  int? _radioValueImageThree;

  int imageNumber = 0;

  String displayImage = app_data.imageURLPraxis[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  void initState() {
    super.initState();
    initFromProvider();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _saveCurrentScreen();
    });
  }

  void _saveCurrentScreen() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setCurrentScreen(ScreenRoutes.visuospatialPraxis);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  // Update the provider with visuospatial praxis scores
  void _updateProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setVisuospatialPraxisImages(
      image1: _radioValueImageOne ?? 0,
      image2: _radioValueImageTwo ?? 0,
      image3: _radioValueImageThree ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double fontSize = 8.0;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        // Update the provider
        _updateProvider();

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testVisuospatialPraxis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testVisuospatialPraxisSubtitle,
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
                                    app_data.testVisuospatialPraxisDetails,
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
                                    app_data.testVisuospatialPraxisToPatient,
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
                                      if (imageNumber > 0) {
                                        setState(() {
                                          imageNumber -= 1;
                                          displayImage = app_data
                                              .imageURLPraxis[imageNumber];
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
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  NavigationHelper.navigateTo(
                                    context,
                                    ShowImage(
                                      imageURL:
                                          app_data.imageURLPraxis[imageNumber],
                                      imageNumber: imageNumber,
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      displayImage,
                                      width: width / 2,
                                    ),
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
                                          displayImage = app_data
                                              .imageURLPraxis[imageNumber];
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
                            color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    app_data.testVisuospatialPraxisScoring,
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
                                  // Text(
                                  //   "Image One",
                                  //   textAlign: TextAlign.center,
                                  //   style: const TextStyle(
                                  //     color: Colors.black,
                                  //     fontWeight: FontWeight.w500,
                                  //     fontSize: 13.0,
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: sizeBoxHeight,
                                  // ),
                                  // Header table
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
                                    ],
                                  ),
                                  // Image 1 scoring table
                                  RadioGroup<int>(
                                    groupValue: _radioValueImageOne,
                                    onChanged: _handleRadioValueChange1,
                                    child: Table(
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
                                  ),
                                  // Image 2 scoring table
                                  RadioGroup<int>(
                                    groupValue: _radioValueImageTwo,
                                    onChanged: _handleRadioValueChange2,
                                    child: Table(
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
                                  ),
                                  // Image 3 scoring table
                                  RadioGroup<int>(
                                    groupValue: _radioValueImageThree,
                                    onChanged: _handleRadioValueChange3,
                                    child: Table(
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
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  elevation: 10.0,
                                ),
                                onPressed: () {
                                  // Update provider with visuospatial praxis scores
                                  _updateProvider();

                                  NavigationHelper.navigateTo(
                                    context,
                                    const Attention(),
                                  );
                                },
                                child: Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
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

  void initFromProvider() {
    // Get data from provider instead of SharedPreferences
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);

    setState(() {
      _radioValueImageOne = scoreModel.visuospatialPraxisImage1;
      _radioValueImageTwo = scoreModel.visuospatialPraxisImage2;
      _radioValueImageThree = scoreModel.visuospatialPraxisImage3;
    });
  }
}
