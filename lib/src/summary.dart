import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mica/src/home.dart';
import 'package:mica/resources/const_data.dart' as appData;
import 'package:mica/src/result_verbal_shortterm_memory.dart';
import 'package:mica/src/result_verbal_working_memory.dart';

//import 'package:share_extend/share_extend.dart';
//import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
//import 'package:path_provider/path_provider.dart';

class TestSummary extends StatefulWidget {
  String patientName;
  String assessorName;
  String handedness;
  DateTime assessmentDate;
  int languageComprehensionRadioValue;
  int trialOneScore;
  int trialTwoScore;
  int trialThreeScore;
  int visuospatialPraxisImage1;
  int visuospatialPraxisImage2;
  int visuospatialPraxisImage3;
  int attention;
  int executiveAnimalNaming;
  int executiveLuria;
  int executiveSerial;
  int shorttermMemoryVerbal;
  int praxis;
  int tenWordDelay;
  int scoreVerbalRecognitionMemoryTenWords;
  int scoreVerbalRecognitionMemoryTenWordsInList;
  int scoreVerbalRecognitionMemoryTenWordsNotInList;
  int shorttermMemoryVisualImage1;
  int shorttermMemoryVisualImage2;
  int shorttermMemoryVisualImage3;
  int anomiaAgnosia;
  int executive;
  int spokenLanguage;

  TestSummary(
      {Key key,
      this.patientName,
      this.assessorName,
      this.handedness,
      this.assessmentDate,
      this.languageComprehensionRadioValue,
      this.trialOneScore,
      this.trialTwoScore,
      this.trialThreeScore,
      this.visuospatialPraxisImage1,
      this.visuospatialPraxisImage2,
      this.visuospatialPraxisImage3,
      this.attention,
      this.executiveAnimalNaming,
      this.executiveLuria,
      this.executiveSerial,
      this.shorttermMemoryVerbal,
      this.praxis,
      this.tenWordDelay,
      this.scoreVerbalRecognitionMemoryTenWords,
      this.scoreVerbalRecognitionMemoryTenWordsInList,
      this.scoreVerbalRecognitionMemoryTenWordsNotInList,
      this.shorttermMemoryVisualImage1,
      this.shorttermMemoryVisualImage2,
      this.shorttermMemoryVisualImage3,
      this.anomiaAgnosia,
      this.executive,
      this.spokenLanguage})
      : super(key: key);

  @override
  _TestSummaryState createState() => _TestSummaryState();
}

class _TestSummaryState extends State<TestSummary> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            title: ListTile(
              title: Text(
                appData.summary,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(
                appData.testSpokenLanguageSubtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            actions: <Widget>[
//              IconButton(
//                icon: Icon(Icons.print),
//                tooltip: "Print",
//                onPressed: () {
//                },
//              ),
              IconButton(
                  icon: Icon(Icons.share),
                  tooltip: "Share Summary",
                  onPressed: () async {
                    print("summary");
                  }),
              IconButton(
                icon: Icon(Icons.home),
                tooltip: "Go Home",
                onPressed: () {
                  var router = new MaterialPageRoute(
                      builder: (BuildContext context) => new Home(
                            viewedDisclaimer: true,
                          ));
                  Navigator.of(context).pushAndRemoveUntil(
                      router, (Route<dynamic> route) => false);
                },
              )
            ],
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                icon: Icon(Icons.score),
                text: "Domain Results",
              ),
              Tab(
                icon: Icon(Icons.all_inclusive),
                text: "Full Report",
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[domainReport(), fullReport()])),
    );
  }

  Widget fullReport() {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Name: ${widget.patientName}"),
            Text("Assessor Name: ${widget.assessorName}"),
            Text("Handedness: ${widget.handedness}"),
            Text("Assessment Date: ${widget.assessmentDate}"),
            Text(
                "Language Comprehension: ${widget.languageComprehensionRadioValue}"),
            Text("Trial 1: ${widget.trialOneScore}"),
            Text("Trial 2: ${widget.trialTwoScore}"),
            Text("Trial 3: ${widget.trialThreeScore}"),
            Text(
                "Visuospartial Praxis Image 1: ${widget.visuospatialPraxisImage1}"),
            Text(
                "Visuospartial Praxis Image 2: ${widget.visuospatialPraxisImage2}"),
            Text(
                "Visuospartial Praxis Image 3: ${widget.visuospatialPraxisImage3}"),
            Text("Attention: ${widget.attention}"),
            Text("Executive Animal Naming: ${widget.executiveAnimalNaming}"),
            Text("Executive Luria: ${widget.executiveLuria}"),
            Text("Executive Serial${widget.executiveSerial}"),
            Text("Short-term Memory Verbal: ${widget.shorttermMemoryVerbal}"),
            Text("Praxis: ${widget.praxis}"),
            Text("Word Delay: ${widget.tenWordDelay}"),
            Text(
                "Recognition Ten Words: ${widget.scoreVerbalRecognitionMemoryTenWords}"),
            Text(
                "Recognition Words in List: ${widget.scoreVerbalRecognitionMemoryTenWordsInList}"),
            Text(
                "Recognition Words not in List: ${widget.scoreVerbalRecognitionMemoryTenWordsNotInList}"),
            Text(
                "Short-term Memory Visual Image 1: ${widget.shorttermMemoryVisualImage1}"),
            Text(
                "Short-term Memory Visual Image 2: ${widget.shorttermMemoryVisualImage2}"),
            Text(
                "Short-term Memory Visual Image 3: ${widget.shorttermMemoryVisualImage3}"),
            Text("Anomia Agnosia: ${widget.anomiaAgnosia}"),
            Text("Executive: ${widget.executive}"),
            Text("Spoken Language: ${widget.spokenLanguage}"),
          ],
        ),
      ],
    );
  }

  Widget domainReport() {
    return ListView(
      children: <Widget>[
        Card(
          color: Colors.white,
          elevation: 10.0,
          child: Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Tap on the card to display more detail about domain results",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Attention & Concentration",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Language",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Verbal Working Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory(
                          workingMemoryVerbalTrial1: widget.trialOneScore,
                        ));
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Verbal Short-Term Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Visual Short-Term Memory",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Praxis",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Gnosis",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),
        Card(
          color: Colors.green,
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "Executive Functions",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                "Domain Result:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                "Normal",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                var router = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new VerbalWorkingMemory());
                Navigator.of(context)
                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
              },
            ),
          ),
        ),

//        Card(
//          color: Colors.red,
//          elevation: 10.0,
//          child: Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: ListTile(
//              title: Text(
//                "Verbal Short-Term Memory",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
//              subtitle: Text(
//                "Domain Result:",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
//              trailing: Text(
//                "Impaired",
//                style: TextStyle(
//                  color: Colors.black,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
//              onTap: () {
//                var router = new MaterialPageRoute(
//                    builder: (BuildContext context) =>
//                        new VerbalShortTermMemory());
//                Navigator.of(context)
//                    .pushAndRemoveUntil(router, (Route<dynamic> route) => true);
//              },
//            ),
//          ),
//        )
      ],
    );
  }
}
