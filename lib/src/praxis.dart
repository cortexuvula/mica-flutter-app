import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/ten_word_delay_recall.dart';
import 'package:mica/src/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';

class Praxis extends StatefulWidget {
  // Using Provider pattern, no need to pass parameters
  const Praxis({super.key});

  @override
  State<Praxis> createState() => _PraxisState();
}

class _PraxisState extends State<Praxis> {
  double sizeBoxHeight = 10.0;
  int? _radioValueRight;
  int? _radioValueLeft;

  final double _fontsize = 8.0;

  @override
  void initState() {
    super.initState();
    getPrefsData();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }
        await savePrefData();
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: Text(
              app_data.testPraxis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testPraxisSubtitle,
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
                      builder: (BuildContext context) => const Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: width * 0.9,
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
                              app_data.testPraxisToPatient,
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
                                0: FlexColumnWidth(0.15),
                                1: FlexColumnWidth(0.27),
                                2: FlexColumnWidth(0.27),
                                3: FlexColumnWidth(0.27)
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Right",
                                      style: TextStyle(fontSize: _fontsize),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        groupValue: _radioValueRight,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValueRight,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValueRight,
                                        onChanged: _handleRadioValueChange,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Left",
                                      style: TextStyle(fontSize: _fontsize),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        groupValue: _radioValueLeft,
                                        onChanged: _handleRadioValueChangeLeft,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Normal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 1,
                                        groupValue: _radioValueLeft,
                                        onChanged: _handleRadioValueChangeLeft,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Equivocal",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 2,
                                        groupValue: _radioValueLeft,
                                        onChanged: _handleRadioValueChangeLeft,
                                        activeColor: Colors.white,
                                      ),
                                      Text(
                                        "Impaired",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: _fontsize,
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
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
                        child: Text(
                          app_data.testPraxis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0),
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
                          ),
                          onPressed: () {
                            // Update score in provider before navigating
                            final micaScoreModel = Provider.of<MicaScoreModel>(
                                context,
                                listen: false);
                            micaScoreModel.setPraxisScores(
                                right: _radioValueRight ?? 0,
                                left: _radioValueLeft ?? 0);

                            // Navigate to next screen using Provider pattern
                            var router = MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TenWordDelayedRecall());
                            Navigator.of(context).push(router);
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
      _radioValueRight = value;
    });

    // Update the provider for both praxis scores
    if (!mounted) return;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    micaScoreModel.setPraxisScores(
        right: _radioValueRight ?? 0, left: _radioValueLeft ?? 0);
  }

  void _handleRadioValueChangeLeft(int? value) {
    setState(() {
      _radioValueLeft = value;
    });

    // Update the provider for both praxis scores
    if (!mounted) return;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    micaScoreModel.setPraxisScores(
        right: _radioValueRight ?? 0, left: _radioValueLeft ?? 0);
  }

  void getPrefsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // We need to add a null check for context since initState might run before build
    if (!mounted) return;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    setState(() {
      _radioValueLeft = prefs.getInt('praxisLeft') ?? micaScoreModel.praxisLeft;
      _radioValueRight =
          prefs.getInt('praxisRight') ?? micaScoreModel.praxisRight;
    });

    // Update provider with loaded values
    micaScoreModel.setPraxisScores(
        right: _radioValueRight ?? 0, left: _radioValueLeft ?? 0);
  }

  Future<bool> savePrefData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('praxisLeft', _radioValueLeft ?? 0);
    await prefs.setInt('praxisRight', _radioValueRight ?? 0);

    // Update provider with final values
    if (!mounted) return true;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
    micaScoreModel.setPraxisScores(
        right: _radioValueRight ?? 0, left: _radioValueLeft ?? 0);

    return true;
  }
}
