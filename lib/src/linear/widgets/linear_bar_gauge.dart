import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';
import 'package:girix_code_gauge/src/linear/painters/linear_bar_painter.dart';

class LinearBarGauge extends StatelessWidget {
  final GaugeValue value;
  final List<LinearBarPointer> barPointers;
  final bool showTooltip;
  final LinearNeedle? needle;
  final Size size;
  final LinearGaugeDirection direction;
  final AlignmentGeometry alignment;
  final double gapBetweenBars;
  final bool showNeedleInsideBar;
  const LinearBarGauge({
    super.key,
    this.direction = LinearGaugeDirection.horizontal,
    required this.value,
    required this.barPointers,
    this.showTooltip = true,
    required this.size,
    this.needle,
    this.gapBetweenBars = 0,
    this.alignment = Alignment.centerLeft,
    this.showNeedleInsideBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: FittedBox(
        alignment: alignment,
        child: CustomPaint(
          painter: LinearBarPainter(
              gapBetweenBars: gapBetweenBars,
              gaugeValue: value,
              barPointers: barPointers,
              needle: needle,
              showNeedleInsideBar: showNeedleInsideBar,
              direction: direction),
          size: size,
        ),
      ),
    );
  }
}
