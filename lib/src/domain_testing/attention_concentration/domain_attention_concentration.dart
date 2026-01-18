import 'package:flutter/material.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_digit.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_language.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_serial_seven.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_spell_word.dart';
import 'package:mica/src/domain_testing/attention_concentration/domain_vigilance.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/resources/strings/attention_strings.dart';

class AttentionConcentration extends StatefulWidget {
  const AttentionConcentration({super.key});

  @override
  State<AttentionConcentration> createState() => _AttentionConcentrationState();
}

class _AttentionConcentrationState extends State<AttentionConcentration> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const double height = 20.0;
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            AttentionStrings.domainTitle,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            AttentionStrings.domainSubtitle,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                          ),
                          onPressed: () {
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              const DomainVigilance(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(
                            AttentionStrings.vigilanceButton,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
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
                          ),
                          onPressed: () {
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              const SpellWordBarkwards(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(
                            AttentionStrings.spellWordButton,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
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
                          ),
                          onPressed: () {
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              const SerialSeven(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(
                            AttentionStrings.serialButton,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
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
                          ),
                          onPressed: () {
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              const Digit(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(
                            AttentionStrings.digitSpanButton,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height,
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
                          ),
                          onPressed: () {
                            NavigationHelper.navigateAndRemoveUntil(
                              context,
                              const DomainLanguage(),
                              (Route<dynamic> route) => true,
                            );
                          },
                          child: Text(
                            AttentionStrings.observationButton,
                            style: TextStyle(color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
