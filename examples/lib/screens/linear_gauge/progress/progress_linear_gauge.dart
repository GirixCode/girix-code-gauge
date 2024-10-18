import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';

class MyProgressLinearGauge extends StatefulWidget {
  const MyProgressLinearGauge({super.key});

  @override
  State<MyProgressLinearGauge> createState() => _MyProgressLinearGaugeState();
}

class _MyProgressLinearGaugeState extends State<MyProgressLinearGauge> {
  final backgroundStyleOne = LinearGaugeStyle(
    size: const Size(300, 0),
    backgroundColor: Colors.grey.shade300,
    foregroundColor: Colors.blue,
    thickness: 10,
  );

  final foregroundStyleOne = LinearGaugeStyle(
    size: const Size(300, 0),
    backgroundColor: Colors.red.shade300,
    foregroundColor: Colors.yellow,
    thickness: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Linear Gauge'),
      ),
      body: ListView(
        key: const Key('linear_gauge_list'),
        children: [
          // const PageHeader(title: 'Progress Linear Gauge'),
          const SizedBox(height: 30),
          ...[
            const Text('Default Linear Gauge'),
            const SizedBox(height: 10),
            ProgressLinearGauge(
              value: const GaugeValue(value: 50, min: 0, max: 100),
              foregroundStyle: foregroundStyleOne,
              backgroundStyle: backgroundStyleOne,
              key: const Key('linear_gauge_1'),
            ),
            const SizedBox(height: 30),

            // Different Needle Types
            const Text('Diamond Needle (Center)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 80, min: 00, max: 100),
              foregroundStyle: LinearGaugeStyle(
                  size: const Size(300, 0),
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.blue,
                  // dense: false,
                  radius: const Radius.circular(20),
                  thickness: 10),
              backgroundStyle: LinearGaugeStyle(
                  size: const Size(300, 50),
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.blue,
                  thickness: 10),
              key: const Key('linear_gauge_2'),
              needle: LinearNeedle(
                  position: LinearGaugeNeedlePosition.center,
                  size: const Size(20, 20),
                  color: Colors.blueGrey[800]!,
                  needleType: LinearGaugeNeedleType.diamond),
            ),
            const SizedBox(height: 30),

            // Different Needle Types
            const Text('Circle Needle (Top)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 40, min: 10, max: 100),
              foregroundStyle: LinearGaugeStyle(
                  size: Size.zero,
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  // dense: false,
                  radius: const Radius.circular(20),
                  thickness: 10),
              backgroundStyle: LinearGaugeStyle(
                  size: const Size(300, 50),
                  radius: const Radius.circular(20),
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  thickness: 10),
              key: const Key('linear_gauge_3'),
              needle: LinearNeedle(
                  enabled: true,
                  position: LinearGaugeNeedlePosition.top,
                  size: const Size(20, 20),
                  color: Colors.blueGrey[800]!,
                  needleType: LinearGaugeNeedleType.circle),
            ),
            const SizedBox(height: 30),

            // Different Needle Types
            const Text('Triangle Needle (Bottom)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 60, min: 10, max: 100),
              foregroundStyle: LinearGaugeStyle(
                  size: Size.zero,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  // dense: false,
                  radius: const Radius.circular(20),
                  thickness: 10),
              backgroundStyle: LinearGaugeStyle(
                  size: const Size(300, 50),
                  radius: const Radius.circular(20),
                  backgroundColor: Colors.blueGrey.shade300,
                  foregroundColor: Colors.black,
                  thickness: 10),
              key: const Key('linear_gauge_4'),
              needle: LinearNeedle(
                  enabled: true,
                  position: LinearGaugeNeedlePosition.bottom,
                  size: const Size(20, 20),
                  color: Colors.blueGrey[800]!,
                  needleType: LinearGaugeNeedleType.triangle),
            ),
            // Pipe Needle
            const SizedBox(height: 30),

            const Text('Pipe Needle (Center)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 70, min: 0, max: 100),
              foregroundStyle: LinearGaugeStyle(
                size: Size.zero,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              backgroundStyle: LinearGaugeStyle(
                size: const Size(300, 50),
                backgroundColor: Colors.blue.shade200,
                foregroundColor: Colors.black,
              ),
              key: const Key('linear_gauge_5'),
              needle: LinearNeedle(
                  enabled: true,
                  position: LinearGaugeNeedlePosition.center,
                  size: const Size(2, 70),
                  color: Colors.blue.shade500,
                  needleType: LinearGaugeNeedleType.pipe),
            ),
            const SizedBox(height: 30),

            const Text('Pipe Needle (bottom)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 45, min: 0, max: 100),
              foregroundStyle: LinearGaugeStyle(
                size: Size.zero,
                backgroundColor: Colors.brown.shade400,
                foregroundColor: Colors.white,
                dense: false,
              ),
              backgroundStyle: LinearGaugeStyle(
                  size: const Size(300, 30),
                  backgroundColor: Colors.brown.shade200,
                  foregroundColor: Colors.black,
                  dense: false,
                  radius: const Radius.circular(20)),
              key: const Key('linear_gauge_5'),
              needle: LinearNeedle(
                  enabled: true,
                  position: LinearGaugeNeedlePosition.bottom,
                  size: const Size(4, 90),
                  color: Colors.brown.shade500,
                  needleType: LinearGaugeNeedleType.pipe),
            ),
            // Custom Needle
            const SizedBox(height: 30),

            const Text('Custom Needle (Center)'),
            ProgressLinearGauge(
              value: const GaugeValue(value: 50, min: 0, max: 100),
              foregroundStyle: LinearGaugeStyle(
                size: Size.zero,
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              backgroundStyle: LinearGaugeStyle(
                size: const Size(300, 50),
                backgroundColor: Colors.greenAccent.shade100,
                foregroundColor: Colors.black,
              ),
              key: const Key('linear_gauge_6'),
              needle: LinearNeedle(
                  enabled: true,
                  position: LinearGaugeNeedlePosition.center,
                  size: const Size(20, 20),
                  color: Colors.blue.shade500,
                  needleType: LinearGaugeNeedleType.custom),
              customDrawNeedle: _drawCustomNeedle,
            ),

            // AnimatedProgressLinearGauge
            const SizedBox(height: 30),
            const Text('Animated Progress Linear Gauge'),
            const SizedBox(height: 10),
            AnimatedProgressLinearGauge(
              value: 60,
              backgroundStyle: LinearGaugeStyle(
                  size: const Size(300, 0),
                  backgroundColor: Colors.deepOrange.shade100,
                  foregroundColor: Colors.black,
                  thickness: 10),
              foregroundStyle: LinearGaugeStyle(
                  size: const Size(300, 0),
                  backgroundColor: Colors.deepOrange.shade400,
                  foregroundColor: Colors.black,
                  thickness: 10),
              animationType: GaugeAnimationType.linear,
              needle: const LinearNeedle(
                  position: LinearGaugeNeedlePosition.bottom,
                  size: Size(20, 20),
                  color: Colors.deepOrange,
                  needleType: LinearGaugeNeedleType.triangle),
              key: const Key('linear_gauge_7'),
            ),
          ].map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), child: e)),
        ],
      ),
    );
  }

// My Custom Needle
  void _drawCustomNeedle(Canvas canvas, Offset position) {
    log('ProgressLinearGauge: Custom Needle');
    final Paint customPaint = Paint()
      ..color = Colors.green.shade600
      ..style = PaintingStyle.fill;

    // Example: Draw a star shape
    Path starPath = Path();
    double radius = 10.0;
    for (int i = 0; i < 5; i++) {
      double angle = (i * 72.0) * (math.pi / 180.0);
      double x = position.dx + radius * math.cos(angle);
      double y = position.dy + radius * math.sin(angle);
      if (i == 0) {
        starPath.moveTo(x, y);
      } else {
        starPath.lineTo(x, y);
      }
    }
    starPath.close();
    canvas.drawPath(starPath, customPaint);
  }
}
