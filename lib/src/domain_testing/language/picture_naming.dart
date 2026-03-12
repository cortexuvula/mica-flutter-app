import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/show_image_anomia.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/utils/screen_routes.dart';
import 'package:mica/src/services/persistence_service.dart';
import 'package:mica/resources/strings/language_strings.dart';
import 'package:mica/resources/strings/common_strings.dart';

class PictureNaming extends StatefulWidget {
  const PictureNaming({super.key});

  @override
  State<PictureNaming> createState() => _PictureNamingState();
}

class _PictureNamingState extends State<PictureNaming> {
  double sizeBoxHeight = 10.0;

  int? _radioValue;
  int? _radioValue2;
  int imageNumber = 0;

  String displayImage = app_data.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;
  bool _imagesPreloaded = false;

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
    scoreModel.setCurrentScreen(ScreenRoutes.languagePictureNaming);
    PersistenceService.saveProgressImmediate(scoreModel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload images to avoid loading delay
    _preloadImages();
  }

  void _preloadImages() {
    if (_imagesPreloaded) return;
    _imagesPreloaded = true;
    for (String imageUrl in app_data.imageURL) {
      precacheImage(AssetImage(imageUrl), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var sizeBoxHeight = width * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          LanguageStrings.pictureNamingTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
          ),
        ),
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
                    color: Colors.yellowAccent.shade400,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            LanguageStrings.pictureNamingPatientInstruction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                            LanguageStrings.pictureNamingExaminerInstruction,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                  width: width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          iconSize: 40.0,
                          onPressed: backButtonActive
                              ? () {
                                  debugPrint("Navigation button tapped");
                                  setState(() {
                                    if (imageNumber > 0) {
                                      imageNumber -= 1;
                                      displayImage =
                                          app_data.imageURL[imageNumber];
                                    }
                                    backButtonActive = imageNumber > 0;
                                    forwardButtonActive = imageNumber < 4;
                                  });
                                }
                              : null),
                      SizedBox(
                        width: 20.0,
                      ),
                      Card(
                        elevation: 10.0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("tapped picture");
                              NavigationHelper.navigateAndRemoveUntil(
                                  context,
                                  ShowImageAnomia(
                                    imageURL: displayImage,
                                    imageNumber: imageNumber,
                                  ),
                                  (Route<dynamic> route) => true);
                            },
                            child: SizedBox(
                              width: 150.0,
                              height: 150.0,
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                switchInCurve: Curves.easeIn,
                                switchOutCurve: Curves.easeOut,
                                transitionBuilder: (Widget child, Animation<double> animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: ScaleTransition(
                                      scale: Tween<double>(
                                        begin: 0.95,
                                        end: 1.0,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  displayImage,
                                  key: ValueKey<int>(imageNumber),
                                  fit: BoxFit.contain,
                                  gaplessPlayback: true,
                                  cacheWidth: 300,
                                  cacheHeight: 300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          iconSize: 40.0,
                          onPressed: forwardButtonActive
                              ? () {
                                  debugPrint("Navigation button tapped");
                                  setState(() {
                                    if (imageNumber < 4) {
                                      imageNumber += 1;
                                      displayImage =
                                          app_data.imageURL[imageNumber];
                                    }
                                    forwardButtonActive = imageNumber < 4;
                                    backButtonActive = imageNumber > 0;
                                  });
                                }
                              : null),
                    ],
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
                          Text(
                            LanguageStrings.pictureNamingAnomiaResponse,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(0.3),
                                1: FlexColumnWidth(0.3),
                                2: FlexColumnWidth(0.34)
                              },
                              children: [
                                TableRow(children: [
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        activeColor: Colors.white,
                                      ),
                                    Text(
                                      CommonStrings.normal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio<int>(
                                      value: 1,
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.equivocal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio<int>(
                                      value: 2,
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.impaired,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings.pictureNamingResponseNormal,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings
                                        .pictureNamingResponseEquivocal,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings
                                        .pictureNamingResponseImpaired,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              ])
                            ],
                          ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            LanguageStrings.pictureNamingAgnosiaResponse,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          RadioGroup<int>(
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                            child: Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(0.3),
                                1: FlexColumnWidth(0.3),
                                2: FlexColumnWidth(0.34)
                              },
                              children: [
                                TableRow(children: [
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        activeColor: Colors.white,
                                      ),
                                    Text(
                                      CommonStrings.normal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio<int>(
                                      value: 1,
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.equivocal,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Radio<int>(
                                      value: 2,
                                      activeColor: Colors.white,
                                    ),
                                    Text(
                                      CommonStrings.impaired,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings.pictureNamingResponseNormal,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings
                                        .pictureNamingResponseEquivocal,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    LanguageStrings
                                        .pictureNamingResponseImpaired,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 10.0),
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
                                final scoreModel = MicaProviders.getScoreModel(context, listen: false);
                                // Note: _radioValue is assessment score (0/1/2), not a count
                                // UI needs refactoring to track actual correct/total counts
                                scoreModel.setLanguagePictureNaming(
                                  correct: _radioValue ?? 0,
                                  total: 5, // 5 pictures in the test (imageNumber 0-4)
                                  agnosia: _radioValue2 ?? 0,
                                );

                                // Pop back to naming menu
                                Navigator.of(context).pop();
                              },
                              child: Text(CommonStrings.taskCompleted,
                                  style: const TextStyle(color: Colors.black)),
                            ),
                          ),
                        ],
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
      _radioValue = value;
    });
  }

  void _handleRadioValueChange2(int? value) {
    setState(() {
      _radioValue2 = value;
    });
  }

  void initFromProvider() {
    // We need to add a null check for context since initState might run before build
    if (!mounted) return;

    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      // Note: Assessment score is mapped to correct field (see note in onPressed handler)
      _radioValue = scoreModel.languagePictureNamingCorrect;
      _radioValue2 = scoreModel.languagePictureAgnosia;
    });
  }
}