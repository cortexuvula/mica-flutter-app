import 'package:flutter/material.dart';

/// A widget for displaying domain assessment sections in the full report
class DomainReportCard extends StatelessWidget {
  final String title;
  final List<TaskRowData> tasks;
  final bool useResultColumn;

  const DomainReportCard({
    super.key,
    required this.title,
    required this.tasks,
    this.useResultColumn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        color: const Color(0xFFF5F5DC),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(color: Colors.grey),
                columnWidths: const {
                  0: FlexColumnWidth(2.5),
                  1: FlexColumnWidth(2.5),
                  2: FlexColumnWidth(1.0),
                  3: FlexColumnWidth(1.0)
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Task',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Scoring Guide',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(useResultColumn ? 'Result' : 'Estimate',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('N / E / I',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  ...tasks.map((task) => _buildTaskRow(task)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTaskRow(TaskRowData task) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(task.taskName),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(task.scoringGuide),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(task.result, textAlign: TextAlign.center),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(task.nei, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

/// Data class for task row information
class TaskRowData {
  final String taskName;
  final String scoringGuide;
  final String result;
  final String nei;

  const TaskRowData({
    required this.taskName,
    required this.scoringGuide,
    required this.result,
    required this.nei,
  });
}