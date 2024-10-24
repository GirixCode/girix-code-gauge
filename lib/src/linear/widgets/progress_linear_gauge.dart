// lib/src/linear/widgets/linear_gauge.dart

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/linear_gauge_common_model.dart';
import 'package:girix_code_gauge/src/linear/models/linear_gauge_style.dart';
import 'package:girix_code_gauge/src/linear/models/linear_needle_model.dart';
import 'package:girix_code_gauge/src/linear/painters/progress_linear_painter.dart';

/// The [GxProgressLinearGauge] widget is used to display a linear gauge.
///
/// The [GxProgressLinearGauge] widget requires the following properties:
///
/// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
///
/// - [style]: An instance of the [ProgressLinearStyle] class that holds the style properties of the gauge.
///
/// - [shape]: An instance of the [LinearGaugeShape] enum that holds the shape of the gauge.
///
/// - [needle]: An instance of the [LinearNeedle] class that holds the needle properties of the Needle.
class GxProgressLinearGauge extends StatelessWidget {
  final GaugeValue value;
  final ProgressLinearStyle style;
  final GaugeLabel? label;
  final LinearNeedle? needle;
  final void Function(Canvas canvas, Offset position)? customDrawNeedle;
  final bool reverse;
  final bool showLabel;
  final double? height;
  const GxProgressLinearGauge(
      {super.key,
      required this.value,
      this.style = const ProgressLinearStyle(),
      this.label,
      this.needle,
      this.customDrawNeedle,
      this.reverse = false,
      this.showLabel = false,
      this.height});

  @override
  Widget build(BuildContext context) {
    final Size size = Size.fromHeight(height ?? style.thickness);

    return CustomPaint(
      size: size,
      painter: ProgressLinearPainter(
          label: label,
          style: style,
          gaugeValue: value,
          needle: needle,
          customDrawNeedle: customDrawNeedle,
          reverse: reverse,
          showLabel: showLabel,
          height: height),
    );
  }
}
