// lib/src/common/widgets/gauge_label.dart

import 'package:flutter/material.dart';

class GaugeLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const GaugeLabel({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
