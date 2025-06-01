import 'package:flutter/material.dart';

/// A reusable widget for displaying domain assessment cards
class DomainCardWidget extends StatelessWidget {
  final String title;
  final Color cardColor;
  final List<Widget> statusIndicators;
  final VoidCallback onTap;

  const DomainCardWidget({
    super.key,
    required this.title,
    required this.cardColor,
    required this.statusIndicators,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Container(
            width: 130.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: statusIndicators,
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

/// A status indicator dot for domain cards
class StatusIndicator extends StatelessWidget {
  final Color color;

  const StatusIndicator({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.brightness_1,
      color: color,
    );
  }
}