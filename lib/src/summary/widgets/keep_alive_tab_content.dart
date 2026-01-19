import 'package:flutter/material.dart';

/// A wrapper widget that keeps its child alive when the parent TabBarView
/// switches to a different tab.
///
/// This prevents unnecessary rebuilds when switching back to a previously
/// viewed tab, improving performance by caching the widget tree.
class KeepAliveTabContent extends StatefulWidget {
  final Widget child;

  const KeepAliveTabContent({
    super.key,
    required this.child,
  });

  @override
  State<KeepAliveTabContent> createState() => _KeepAliveTabContentState();
}

class _KeepAliveTabContentState extends State<KeepAliveTabContent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required when using AutomaticKeepAliveClientMixin
    return widget.child;
  }
}
