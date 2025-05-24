import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/spoken_language.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';
import 'package:mica/src/utils/navigation_helper.dart';

class Executive extends StatefulWidget {
  // Using Provider pattern, no need for parameters
  const Executive({super.key});
  @override
  State<Executive> createState() => _ExecutiveState();
}

class _ExecutiveState extends State<Executive> with TickerProviderStateMixin {
  double sizeBoxHeight = 10.0;

  int _radioValue = 0;
  int imageNumber = 0;

  String displayImage = app_data.imageURL[0];

  bool backButtonActive = false;
  bool forwardButtonActive = true;

  late AnimationController clockController;

  String buttonText = "Start";

  String get timerString {
    Duration duration = clockController.duration! * clockController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    clockController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    getPrefsData();
  }

  @override
  void dispose() {
    clockController.dispose();
    super.dispose();
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

        // Cache the navigator state before the async operation
        final navigatorState = Navigator.of(context);

        // Perform async operation
        await updateProviderData();

        // Check if still mounted before continuing
        if (!mounted) return;

        // Use cached navigator state instead of context directly
        navigatorState.push(
          MaterialPageRoute(
            builder: (context) => const Welcome(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testExecutive,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testExecutiveSubtitle,
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
                  NavigationHelper.navigateAndRemoveUntil(context,
                      const Welcome(), (Route<dynamic> route) => false);
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
                      color: Colors.yellowAccent.shade400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testExecutiveToPatient,
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
                              app_data.testExecutiveDetails,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: width * 0.8,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 100.0,
                                        child: Image.asset(
                                          "./images/hash.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 100.0,
                                        child: Image.asset(
                                          "./images/steps.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
                              app_data.testExecutiveToPatient2,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: AnimatedBuilder(
                                  animation: clockController,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Text(
                                      timerString,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500),
                                    );
                                  }),
                            ),
                            SizedBox(
                              width: 150.0,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyan.shade200,
                                  ),
                                  onPressed: () {
                                    if (clockController.isAnimating) {
                                      clockController.stop();
                                      setState(() {
                                        buttonText = "Resume";
                                      });
                                    } else {
                                      clockController.reverse(
                                          from: clockController.value == 0.0
                                              ? 1.0
                                              : clockController.value);
                                      setState(() {
                                        buttonText = "Pause";
                                      });
                                    }
                                  },
                                  child: Text(
                                    buttonText,
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
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
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              app_data.testExecutiveResponse,
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
                              columnWidths: {
                                0: const FlexColumnWidth(0.3),
                                1: const FlexColumnWidth(0.3),
                                2: const FlexColumnWidth(0.34)
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
                                        style: const TextStyle(
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
                                        style: const TextStyle(
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
                                        style: const TextStyle(
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
                                      app_data.testExecutiveResponseNormal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testExecutiveResponseEquivocal,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      app_data.testExecutiveResponseImpaired,
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
                          onPressed: () {
                            // Update the provider with the executive value
                            final micaScoreModel = Provider.of<MicaScoreModel>(
                                context,
                                listen: false);
                            micaScoreModel.setExecutive(_radioValue);

                            // Navigate to SpokenLanguage using Provider pattern
                            NavigationHelper.navigateAndRemoveUntil(
                                context,
                                const SpokenLanguage(),
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

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue =
          value!; // Value is guaranteed to be non-null due to Radio widget configuration
    });

    // Update the provider
    if (mounted) {
      final micaScoreModel =
          Provider.of<MicaScoreModel>(context, listen: false);
      micaScoreModel.setExecutive(_radioValue);
    }
  }

  Future<void> getPrefsData() async {
    // We need to add a null check for context since initState might run before build
    if (!mounted) return;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    setState(() {
      _radioValue = micaScoreModel.executive;
    });
  }

  Future<void> updateProviderData() async {
    // Update the provider
    if (mounted) {
      final micaScoreModel =
          Provider.of<MicaScoreModel>(context, listen: false);
      micaScoreModel.setExecutive(_radioValue);
    }
  }
}
