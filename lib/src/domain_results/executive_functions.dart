import 'package:flutter/material.dart';
import 'package:mica/src/providers/mica_provider.dart';

class ExecutiveFunctions extends StatefulWidget {
  final int executiveAnimalNaming;
  final int executiveDesignFluency;
  final int executiveLuria;
  final int executiveSerial;

  const ExecutiveFunctions({
    super.key,
    required this.executiveAnimalNaming,
    required this.executiveDesignFluency,
    required this.executiveLuria,
    required this.executiveSerial,
  });

  @override
  ExecutiveFunctionsState createState() => ExecutiveFunctionsState();
}

class ExecutiveFunctionsState extends State<ExecutiveFunctions> {
  late Color cardColorAnimalNaming;
  late Color cardColorDesignFluency;
  late Color cardColorLuria;
  late Color cardColorSerial;
  String resultAnimalNaming = "";
  String resultDesignFluency = "";
  String resultLuria = "";
  String resultSerial = "";

  @override
  void initState() {
    super.initState();

    _radioValueToResult(widget.executiveAnimalNaming, (color, result) {
      cardColorAnimalNaming = color;
      resultAnimalNaming = result;
    });
    _radioValueToResult(widget.executiveDesignFluency, (color, result) {
      cardColorDesignFluency = color;
      resultDesignFluency = result;
    });
    _radioValueToResult(widget.executiveLuria, (color, result) {
      cardColorLuria = color;
      resultLuria = result;
    });
    _radioValueToResult(widget.executiveSerial, (color, result) {
      cardColorSerial = color;
      resultSerial = result;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MicaProviders.getScoreModel(context, listen: false)
          .markDomainCompleted('executive_function');
    });
  }

  void _radioValueToResult(int value, void Function(Color, String) setter) {
    switch (value) {
      case 0:
        setter(Colors.green, "Normal");
        break;
      case 1:
        setter(Colors.yellow, "Equivocal");
        break;
      case 2:
        setter(Colors.red, "Impaired");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: const Text(
            "Executive Function",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.start,
          ),
          subtitle: const Text(
            "",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildResultCard("Executive: Animal Naming Task",
              cardColorAnimalNaming, resultAnimalNaming),
          _buildResultCard("Executive: Design Fluency",
              cardColorDesignFluency, resultDesignFluency),
          _buildResultCard("Executive: Luria Alternating Hand Movements",
              cardColorLuria, resultLuria),
          _buildResultCard("Executive: Serial Order Reversal",
              cardColorSerial, resultSerial),
        ],
      ),
    );
  }

  Widget _buildResultCard(String title, Color color, String result) {
    return Card(
      color: color,
      elevation: 10.0,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          result,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
