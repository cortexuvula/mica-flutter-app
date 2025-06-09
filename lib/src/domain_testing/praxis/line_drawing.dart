import 'package:flutter/material.dart';
import 'package:mica/src/welcome.dart';
import 'package:mica/src/utils/navigation_helper.dart';
import 'package:mica/src/providers/mica_provider.dart';

class LineDrawing extends StatefulWidget {
  const LineDrawing({super.key});

  @override
  State<LineDrawing> createState() => _LineDrawingState();
}

class _LineDrawingState extends State<LineDrawing> {
  // Scores for each image (0 = No Drawing, 1 = Poor, 2 = Few Omissions, 3 = No Mistakes)
  int? _image1Score;
  int? _image2Score;
  int? _image3Score;
  
  int _currentImageIndex = 0;
  final List<String> _imagePaths = [
    './images/line_drawing_1.png',
    './images/line_drawing_2.png',
    './images/line_drawing_3.png',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize from provider if needed
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFromProvider();
    });
  }

  void _initializeFromProvider() {
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    setState(() {
      // Initialize with existing scores if any
      // For now, using praxisRight as a general score
      _image1Score = scoreModel.praxisRight;
      _image2Score = scoreModel.praxisRight;
      _image3Score = scoreModel.praxisRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double height = 10.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Line Drawing',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.0,
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
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Examiner instruction card (purple)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.deepPurple.shade300,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Line drawings are presented, and the patient is asked to copy them. The ability to successfully copy a line drawing depends on correct recognition of the drawing with visual processing. This input function is part of gnosis. Drawing with the dominant hand is an output function and part of praxis as it involves motor planning.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'The patient can be asked if their drawing resembles the stimulus drawing. If the patient says the drawing differs from the stimulus, but they do not know how to draw it correctly then it may indicate visual perception is intact but not higher order motor control.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Patient instruction card (yellow)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.yellowAccent.shade400,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '"Copy these drawings."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Image carousel
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.chevron_left,
                                size: 40.0,
                                color: _currentImageIndex > 0 
                                    ? Colors.black 
                                    : Colors.grey.shade400,
                              ),
                              onPressed: _currentImageIndex > 0
                                  ? () {
                                      setState(() {
                                        _currentImageIndex--;
                                      });
                                    }
                                  : null,
                            ),
                            Expanded(
                              child: Container(
                                height: 200,
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  _imagePaths[_currentImageIndex],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.chevron_right,
                                size: 40.0,
                                color: _currentImageIndex < 2 
                                    ? Colors.black 
                                    : Colors.grey.shade400,
                              ),
                              onPressed: _currentImageIndex < 2
                                  ? () {
                                      setState(() {
                                        _currentImageIndex++;
                                      });
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Scoring card (green)
              SizedBox(
                width: width * 0.9,
                child: Card(
                  elevation: 10.0,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Cannot name picture',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        // Table for scoring
                        Table(
                          border: TableBorder.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          columnWidths: const {
                            0: FlexColumnWidth(1.5),
                            1: FlexColumnWidth(1.2),
                            2: FlexColumnWidth(1.2),
                            3: FlexColumnWidth(1),
                            4: FlexColumnWidth(1.2),
                          },
                          children: [
                            // Header row
                            const TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Image',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'No Mistakes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Few Omissions',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Poor',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'No Drawing',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Image 1 row
                            TableRow(
                              children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Image 1',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                _buildScoreCell(1, 3),
                                _buildScoreCell(1, 2),
                                _buildScoreCell(1, 1),
                                _buildScoreCell(1, 0),
                              ],
                            ),
                            // Image 2 row
                            TableRow(
                              children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Image 2',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                _buildScoreCell(2, 3),
                                _buildScoreCell(2, 2),
                                _buildScoreCell(2, 1),
                                _buildScoreCell(2, 0),
                              ],
                            ),
                            // Image 3 row
                            TableRow(
                              children: [
                                const TableCell(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Image 3',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                _buildScoreCell(3, 3),
                                _buildScoreCell(3, 2),
                                _buildScoreCell(3, 1),
                                _buildScoreCell(3, 0),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              
              // Task completed button
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
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                      ),
                      onPressed: () {
                        // Save scores to provider
                        _saveScores();
                        // Navigate back
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Task Completed',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScoreCell(int imageNumber, int score) {
    int? currentScore;
    switch (imageNumber) {
      case 1:
        currentScore = _image1Score;
        break;
      case 2:
        currentScore = _image2Score;
        break;
      case 3:
        currentScore = _image3Score;
        break;
    }

    return TableCell(
      child: InkWell(
        onTap: () => _handleRadioChange(imageNumber, score),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<int>(
                value: score,
                groupValue: currentScore,
                onChanged: (value) => _handleRadioChange(imageNumber, value),
                fillColor: WidgetStateProperty.resolveWith<Color>(
                  (states) {
                    if (states.contains(WidgetState.selected)) {
                      return Colors.white;
                    }
                    return Colors.black;
                  },
                ),
              ),
              Text(
                score.toString(),
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRadioChange(int imageNumber, int? value) {
    setState(() {
      switch (imageNumber) {
        case 1:
          _image1Score = value;
          break;
        case 2:
          _image2Score = value;
          break;
        case 3:
          _image3Score = value;
          break;
      }
    });
    // Save to provider immediately
    _saveScores();
  }

  void _saveScores() {
    if (!mounted) return;
    
    final scoreModel = MicaProviders.getScoreModel(context, listen: false);
    // Calculate average score or use the first image score for now
    int totalScore = (_image1Score ?? 0) + (_image2Score ?? 0) + (_image3Score ?? 0);
    int avgScore = (totalScore / 3).round();
    
    // Store as praxisRight for now
    // You may want to add specific fields for line drawing scores
    scoreModel.setPraxisScores(
      right: avgScore,
      left: scoreModel.praxisLeft,
    );
  }
}