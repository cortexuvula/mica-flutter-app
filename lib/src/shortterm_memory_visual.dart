import 'package:flutter/material.dart';
import 'package:mica/resources/const_data.dart' as app_data;
import 'package:mica/src/anomia_agnosia.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/models/mica_score_model.dart';
import 'package:provider/provider.dart';

class ShortTermMemoryVisual extends StatefulWidget {
  // Using Provider pattern, no need for parameters
  const ShortTermMemoryVisual({super.key});

  @override
  State<ShortTermMemoryVisual> createState() => _ShortTermMemoryVisualState();
}

class _ShortTermMemoryVisualState extends State<ShortTermMemoryVisual> {
  double sizeBoxHeight = 10.0;

  int? _radioValueImageOne;
  int? _radioValueImageTwo;
  int? _radioValueImageThree;

  final double _fontSize = 8.0;

  @override
  void initState() {
    super.initState();
    initStateData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // var _sizeboxWidth = _width * 0.8 / 5;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Welcome(),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: ListTile(
            title: Text(
              app_data.testShortTermMemoryVisual,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            subtitle: Text(
              app_data.testShortTermMemoryVisualSubtitle,
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
                      builder: (BuildContext context) => Welcome());
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
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
                              app_data.testShortTermMemoryVisualToPatient,
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
                              app_data.testShortTermMemoryVisualDetails,
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
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width * 0.9,
                          height: 200.0,
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  height: 180.0,
                                  child: Image.asset("./images/block_one.png",
                                      fit: BoxFit.scaleDown),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  height: 180.0,
                                  child: Image.asset(
                                    "./images/block_two.png",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  height: 180.0,
                                  child: Image.asset(
                                    "./images/block_three.png",
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            ],
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
                            Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(0.2),
                                1: FlexColumnWidth(0.2),
                                2: FlexColumnWidth(0.2),
                                3: FlexColumnWidth(0.2),
                                4: FlexColumnWidth(0.2),
                              },
                              children: [
                                TableRow(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Image",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Mistakes",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Few Omissions",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Poor",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No Drawing",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _fontSize,
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
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
                                ]),
                                TableRow(children: [
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
                                ]),
                                TableRow(children: [
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
                            // Update provider with the final visual memory scores
                            if (mounted) {
                              final micaScoreModel =
                                  Provider.of<MicaScoreModel>(context, listen: false);
                              micaScoreModel.setShorttermMemoryVisualImages(
                                image1: _radioValueImageOne ?? 0,
                                image2: _radioValueImageTwo ?? 0,
                                image3: _radioValueImageThree ?? 0
                              );

                              // Navigate to next screen
                              var router = MaterialPageRoute(
                                  builder: (BuildContext context) => const AnomiaAgnosia());
                              Navigator.of(context).push(router);
                            }
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

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValueImageOne = value;
    });

    // Update provider with all image values
    if (mounted) {
      final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
      micaScoreModel.setShorttermMemoryVisualImages(
        image1: _radioValueImageOne ?? 0,
        image2: _radioValueImageTwo ?? 0,
        image3: _radioValueImageThree ?? 0,
      );
    }
  }

  void _handleRadioValueChange2(int? value) {
    setState(() {
      _radioValueImageTwo = value;
    });

    // Update provider with all image values
    if (mounted) {
      final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
      micaScoreModel.setShorttermMemoryVisualImages(
        image1: _radioValueImageOne ?? 0,
        image2: _radioValueImageTwo ?? 0,
        image3: _radioValueImageThree ?? 0,
      );
    }
  }

  void _handleRadioValueChange3(int? value) {
    setState(() {
      _radioValueImageThree = value;
    });

    // Update provider with all image values
    if (mounted) {
      final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);
      micaScoreModel.setShorttermMemoryVisualImages(
        image1: _radioValueImageOne ?? 0,
        image2: _radioValueImageTwo ?? 0,
        image3: _radioValueImageThree ?? 0,
      );
    }
  }

  void initStateData() {
    // We need to add a null check for context since initState might run before build
    if (!mounted) return;

    final micaScoreModel = Provider.of<MicaScoreModel>(context, listen: false);

    setState(() {
      _radioValueImageOne = micaScoreModel.shorttermMemoryVisualImage1;
      _radioValueImageTwo = micaScoreModel.shorttermMemoryVisualImage2;
      _radioValueImageThree = micaScoreModel.shorttermMemoryVisualImage3;
    });
  }
}
