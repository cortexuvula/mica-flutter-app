import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double maxAppWidth = 800.0;
  
  /// Get the effective app width considering the max constraint
  static double getEffectiveWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > maxAppWidth ? maxAppWidth : screenWidth;
  }
  
  /// Calculate width as a fraction of effective app width
  static double widthFraction(BuildContext context, double fraction) {
    return getEffectiveWidth(context) * fraction;
  }
  
  /// Check if we're on a constrained screen
  static bool isConstrainedScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > maxAppWidth;
  }
}

/// A responsive row that automatically handles overflow on constrained screens
class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  
  const ResponsiveRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  });

  @override
  Widget build(BuildContext context) {
    // Wrap children with Flexible if they're SizedBox with width
    final wrappedChildren = children.map((child) {
      if (child is SizedBox && child.width != null) {
        return Flexible(
          child: SizedBox(
            height: child.height,
            child: child.child,
          ),
        );
      }
      return child;
    }).toList();

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: wrappedChildren,
    );
  }
}