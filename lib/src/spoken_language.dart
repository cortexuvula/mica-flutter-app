import 'package:flutter/material.dart';
import 'package:mica/src/providers/mica_provider.dart';
import 'package:mica/src/summary/summary_with_provider_refactored.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/welcome.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class SpokenLanguage extends StatefulWidget {
  const SpokenLanguage({super.key});

  @override
  SpokenLanguageState createState() => SpokenLanguageState();
}

class SpokenLanguageState extends State<SpokenLanguage> {
  final double sizeBoxHeight = 10.0;

  late int _radioValue;
  int imageNumber = 0;

  String displayImage = app_data.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  @override
  void initState() {
    super.initState();
    _radioValue = 0; // Initialize with a default value (e.g., 0 for "Normal")

    // Initialize from provider data
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeProviderModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        // Update the provider
        _updateProvider();

        NavigationHelper.navigateTo(context, const Welcome());
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testSpokenLanguage,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testSpokenLanguageSubtitle,
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
                  NavigationHelper.navigateAndRemoveUntil(
                    context,
                    const Welcome(),
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testSpokenLanguageResponse,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Table(
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
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
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
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValue,
                                        onChanged: (int? value) {
                                          if (value != null) {
                                            _handleRadioValueChange(value);
                                          }
                                        },
                                        activeColor: Colors.white,
                                      ),
                                      const Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testSpokenLanguageResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testSpokenLanguageResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data
                                          .testSpokenLanguageResponseImpaired,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
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
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10.0,
                          ),
                          onPressed: () {
                            // Update the provider with the spoken language value
                            _updateProvider();

                            // Navigate to the refactored Provider-based summary page
                            NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const TestSummaryWithProviderRefactored(),
                                (Route<dynamic> route) => true);
                          },
                          child: const Text("Continue",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });

    // Update the provider with the new value
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    scoreModel.setSpokenLanguage(value);
  }

  /// Update provider with the current test data
  void _updateProvider() {
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    micaScoreModel.setSpokenLanguage(_radioValue);
  }

  // Initialize provider model now directly reads from provider
  void _initializeProviderModel() {
    // With direct Provider pattern, we sync local state with provider
    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    setState(() {
      _radioValue = micaScoreModel.spokenLanguage;
    });
  }
}
