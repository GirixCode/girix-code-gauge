import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:girix_code_gauge/src/common/models/models.dart';
import 'package:girix_code_gauge/src/common/utils/typedef.dart';
import 'package:girix_code_gauge/src/linear/models/linear_needle_model.dart';
import 'package:girix_code_gauge/src/linear/models/scale_linear_gauge_model.dart';
import 'package:girix_code_gauge/src/linear/painters/needle_utils.dart';

/// The [GxScaleLinearGauge] widget is used to display a linear gauge with a scale.
///
/// The [GxScaleLinearGauge] widget requires the following properties:
///
/// - [gaugeType]: An instance of the [ScaleLinearGaugeType] enum that holds the type of gauge to be drawn.
///
/// - [orientation]: An instance of the [LinearGaugeOrientation] enum that holds the orientation of the gauge.
///
/// - [minimum]: A double value that holds the minimum value of the gauge.
///
/// - [maximum]: A double value that holds the maximum value of the gauge.
///
/// - [interval]: A double value that holds the interval of the gauge.
///
/// - [axisSpaceExtent]: A double value that holds the extent of the axis track of the gauge such as the thickness of the axis track.
///
/// - [axisLabelStyle]: An instance of the [TextStyle] class that holds the style of the axis label of the gauge.
///
/// - [axisTrackStyle]: An instance of the [LinearAxisTrackStyle] class that holds the style of the axis track of the gauge.
///
/// - [minorTicksPerInterval]: An integer value that holds the number of minor ticks per interval of the gauge axis.
///
/// - [majorTickStyle]: An instance of the [LinearTickStyle] class that holds the style of the major tick of the gauge axis.
///
/// - [minorTickStyle]: An instance of the [LinearTickStyle] class that holds the style of the minor tick of the gauge axis.
///
/// - [ranges]: A list of [LinearGaugeRange] that holds the list of ranges of the gauge.
///
/// - [barPointers]: A list of [LinearBarPointer] that holds the list of bar pointers of the gauge.
///
/// - [markerPointers]: A list of [LinearMarkerPointer] that holds the list of marker pointers of the gauge.
///
///
/// ```dart
/// GxScaleLinearGauge(
///  gaugeType: ScaleLinearGaugeType.defaultGauge,
///  orientation: LinearGaugeOrientation.horizontal,
///  minimum: 0.0,
///  maximum: 100.0,
///  interval: 10.0,
///  axisSpaceExtent: 0.0,
///  axisLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
///  axisTrackStyle: const LinearAxisTrackStyle(
///   thickness = 5.0,
///   color = Colors.grey,
///  ),
///  minorTicksPerInterval: 1,
///  majorTickStyle: const LinearTickStyle(
///   length = 8.0,
///   thickness = 1.0,
///   color = Colors.black,
///  ),
///  minorTickStyle: const LinearTickStyle(
///   length = 8.0,
///   thickness = 1.0,
///   color = Colors.black,
///  ),
///  ranges: [
///    LinearGaugeRange(
///     startValue: 0.0,
///     endValue: 50.0,
///     color: Colors.green,
///     label: 'Low',
///   ),
///  ],
///  barPointers: [
///    LinearBarPointer(
///     value: 50.0,
///     color: Colors.red,
///     thickness: 10.0,
///  ),
/// ],
/// markerPointers: [
///  LinearMarkerPointer(
///    value: 50.0,
///    marker: Icon(Icons.star, color: Colors.yellow),
/// ),
/// ],
/// )
/// ```
///
class GxScaleLinearGauge extends StatelessWidget {
  /// Specifies the type of gauge to be drawn of the [GxScaleLinearGauge].
  ///
  /// The default value is [ScaleLinearGaugeType.defaultGauge].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  gaugeType: ScaleLinearGaugeType.defaultGauge,
  /// )
  /// ```
  ///
  final ScaleLinearGaugeType gaugeType;

  /// Specifies the orientation of the gauge.
  ///
  /// The default value is [LinearGaugeOrientation.horizontal].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// orientation: LinearGaugeOrientation.horizontal,
  /// )
  /// ```
  ///
  final LinearGaugeOrientation orientation;

  /// Specifies the minimum value of the gauge.
  ///
  /// The default value is 0.0.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// minimum: 0.0,
  /// )
  /// ```
  ///
  final double minimum;

  /// Specifies the maximum value of the gauge.
  ///
  /// The default value is 100.0.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// maximum: 100.0,
  /// )
  /// ```
  ///
  final double maximum;

  /// Specifies the interval of the gauge.
  ///
  /// The default value is 10.0
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// interval: 10.0,
  /// )
  /// ```
  ///
  final double? interval;

  /// Specifies the extent of the axis track of the gauge such as the amount of size of the axis track from the axis line.
  ///
  /// The default value is 0.0.
  ///
  /// Example:
  ///
  /// When 0: SizeStart<-AxisTrack ->SizeEnd
  ///
  /// When 10: SizeStart__10__AxisTrack__10__SizeEnd
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// axisSpaceExtent: 0.0,
  /// )
  /// ```
  ///
  final double axisSpaceExtent;

  /// Specifies the style of the axis label of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// axisLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
  /// )
  /// ```
  ///
  final TextStyle? axisLabelStyle;

  /// Specifies the style of the axis track of the gauge.
  ///
  /// The default value is [LinearAxisTrackStyle()].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// axisTrackStyle: const LinearAxisTrackStyle(
  ///   thickness = 5.0,
  ///   color = Colors.grey,
  ///  ),
  /// )
  /// ```
  ///
  final LinearAxisTrackStyle axisTrackStyle;

  /// Specifies the number of minor ticks per interval of the gauge axis. such as the number of minor ticks between two major ticks.
  ///
  /// The default value is 1.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///   minorTicksPerInterval: 1,
  /// )
  /// ```
  ///
  final int minorTicksPerInterval;

  /// Specifies the style of the major tick of the gauge axis such as the color, thickness, and length of the major tick.
  ///
  /// The default value is [LinearTickStyle()].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///   majorTickStyle: const LinearTickStyle(
  ///     length = 8.0,
  ///     thickness = 1.0,
  ///     color = Colors.black,
  ///   ),
  /// )
  /// ```
  ///
  final LinearTickStyle majorTickStyle;

  /// Specifies the style of the minor tick of the gauge axis such as the color, thickness, and length of the minor tick.
  ///
  /// The default value is [LinearTickStyle()].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  minorTickStyle: const LinearTickStyle(
  ///   length = 8.0,
  ///   thickness = 1.0,
  ///   color = Colors.black,
  ///   ),
  /// )
  /// ```
  ///
  final LinearTickStyle minorTickStyle;

  /// Specifies the list of ranges of the gauge
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  ranges: [
  ///   LinearGaugeRange(
  ///     startValue: 0.0,
  ///     endValue: 50.0,
  ///     color: Colors.green,
  ///     label: 'Low',
  ///   ),
  /// LinearGaugeRange(
  ///     startValue: 50.0,
  ///     endValue: 75.0,
  ///     color: Colors.orange,
  ///     label: 'Medium',
  ///   ),
  ///
  ///   ]
  /// )
  /// ```
  ///
  final List<LinearGaugeRange>? ranges;

  /// Specifies the list of bar pointers of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///   barPointers: [
  ///     LinearBarPointer(
  ///       value: 50.0,
  ///       color: Colors.red,
  ///       thickness: 10.0,
  ///     ),
  ///   ],
  /// )
  /// ```
  ///
  final List<LinearBarPointer>? barPointers;

  /// Specifies the list of marker pointers of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  markerPointers: [
  ///   LinearMarkerPointer(
  ///       value: 50.0,
  ///       marker: Icon(Icons.star, color: Colors.yellow),
  ///     ),
  ///   ],
  /// )
  /// ```
  ///
  final List<LinearMarkerPointer>? markerPointers;

  /// Specifies the width of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  width: 300.0,
  /// )
  /// ```
  ///
  final double? width;

  /// Specifies the height of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  /// height: 100.0,
  /// )
  /// ```
  ///
  final double? height;

  /// Specifies the value to label format callback of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  valueToLabelFormatCallback: (value) => value.toStringAsFixed(0),
  /// )
  /// ```
  ///
  final ValueToLabelFormatCallback? valueToLabelFormatCallback;

  /// Specifies the label position of the gauge.
  ///
  /// The default value is [LinearGaugeLabelPosition.bottomCenter].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///   labelPosition: LinearGaugeLabelPosition.bottomCenter,
  /// )
  /// ```
  ///
  final LinearGaugeLabelPosition labelPosition;

  /// Specifies the tick position of the gauge.
  ///
  /// The default value is [LinearElementPosition.cross].
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  tickPosition: LinearElementPosition.cross,
  /// )
  /// ```
  ///
  final LinearElementPosition tickPosition;

  /// Specifies whether to show the major ticks of the gauge.
  ///
  /// The default value is true.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  showMajorTicks: true,
  /// )
  /// ```
  ///
  final bool showMajorTicks;

  /// Specifies whether to show the minor ticks of the gauge.
  ///
  /// The default value is true.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  showMinorTicks: true,
  /// )
  /// ```
  ///
  final bool showMinorTicks;

  /// Specifies whether to show the axis track of the gauge.
  ///
  /// The default value is true.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  showAxisTrack: true,
  /// )
  /// ```
  ///
  final bool showAxisTrack;

  /// Specifies whether to show the axis label of the gauge.
  ///
  /// The default value is true.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  showAxisLabel: true,
  /// )
  /// ```
  final bool showAxisLabel;

  /// Specifies the value to major tick style callback of the gauge.
  ///
  /// The default value is null.
  ///
  ///  The [majorTickStyle] argument will be ignored if the [valueToMajorTickStyleCallback] is not null.
  ///
  /// ```dart
  /// LinearTickStyle majorTickStyle(double value, int index) {
  ///  return LinearTickStyle(
  ///   length: 20,
  ///   thickness: 2,
  ///   color: Colors.blue,
  /// );
  /// }
  /// ```
  ///
  final ValueToMajorTickStyleCallback? valueToMajorTickStyleCallback;

  /// Specifies the needle of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///   needle: LinearNeedle(
  ///      enabled: true,
  ///      position: LinearGaugeNeedlePosition.bottom,
  ///      size: const Size(20, 20),
  ///      color: Colors.blueGrey,
  ///     needleType: LinearGaugeNeedleType.triangle),
  /// )
  /// ```
  ///
  final LinearNeedle? needle;

  /// Specifies the value of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  value: const GaugeValue(value: 50, min: 0, max: 100),
  /// )
  /// ```
  ///
  final GaugeValue? value;

  /// Specifies the list of fill area pointer of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// GxScaleLinearGauge(
  ///  fillAreaPointers: [
  ///    FillAreaPointer(
  ///     startValue: 0.0,
  ///     endValue: 50.0,
  ///     color: Colors.green,
  ///     thickness: 10.0,
  ///   ),
  ///  ],
  /// )
  /// ```
  ///
  final List<FillAreaPointer>? fillAreaPointers;

  /// Specifies the value to label style callback of the gauge.
  ///
  /// The default value is null.
  ///
  /// ```dart
  /// TextStyle valueToLabelStyle(double value) {
  ///   return TextStyle(
  ///   color: Colors.black,
  ///   fontSize: 12,
  ///  );
  /// }
  /// ```
  ///
  final ValueToLabelStyleCallback? valueToLabelStyleCallback;

  const GxScaleLinearGauge({
    super.key,
    this.gaugeType = ScaleLinearGaugeType.defaultGauge,
    this.orientation = LinearGaugeOrientation.horizontal,
    this.minimum = 0.0,
    this.maximum = 100.0,
    this.interval,
    this.axisSpaceExtent = 0.0,
    this.axisLabelStyle,
    this.axisTrackStyle = const LinearAxisTrackStyle(),
    this.minorTicksPerInterval = 1,
    this.majorTickStyle = const LinearTickStyle(),
    this.minorTickStyle = const LinearTickStyle(),
    this.ranges,
    this.barPointers,
    this.markerPointers,
    this.width,
    this.height,
    this.valueToLabelFormatCallback,
    this.labelPosition = LinearGaugeLabelPosition.bottomCenter,
    this.tickPosition = LinearElementPosition.cross,
    this.showMajorTicks = true,
    this.showMinorTicks = true,
    this.showAxisTrack = true,
    this.showAxisLabel = true,
    this.valueToMajorTickStyleCallback,
    this.needle,
    this.value,
    this.fillAreaPointers,
    this.valueToLabelStyleCallback,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
          painter: _ScaleLinearGaugePainter(
            gaugeType: gaugeType,
            orientation: orientation,
            minimum: minimum,
            maximum: maximum,
            interval: interval,
            axisSpaceExtent: axisSpaceExtent,
            axisLabelStyle: axisLabelStyle,
            axisTrackStyle: axisTrackStyle,
            minorTicksPerInterval: minorTicksPerInterval,
            majorTickStyle: majorTickStyle,
            minorTickStyle: minorTickStyle,
            ranges: ranges,
            barPointers: barPointers,
            markerPointers: markerPointers,
            valueToLabelFormatCallback: valueToLabelFormatCallback,
            labelPosition: labelPosition,
            tickPosition: tickPosition,
            showMajorTicks: showMajorTicks,
            showMinorTicks: showMinorTicks,
            showAxisTrack: showAxisTrack,
            showAxisLabel: showAxisLabel,
            valueToMajorTickStyleCallback: valueToMajorTickStyleCallback,
            value: value,
            needle: needle,
            fillAreaPointers: fillAreaPointers,
            valueToLabelStyleCallback: valueToLabelStyleCallback,
          ),
          size: height == null || width == null
              ? Size.infinite
              : Size(width!, height!)),
    );
  }
}

class _ScaleLinearGaugePainter extends CustomPainter {
  final ScaleLinearGaugeType gaugeType;
  final LinearGaugeOrientation orientation;
  final double minimum;
  final double maximum;
  final double? interval;
  final double axisSpaceExtent;
  final TextStyle? axisLabelStyle;
  final LinearAxisTrackStyle axisTrackStyle;
  final int minorTicksPerInterval;
  final LinearTickStyle majorTickStyle;
  final LinearTickStyle minorTickStyle;
  final List<LinearGaugeRange>? ranges;
  final List<LinearBarPointer>? barPointers;
  final List<LinearMarkerPointer>? markerPointers;
  final ValueToLabelFormatCallback? valueToLabelFormatCallback;
  final LinearGaugeLabelPosition labelPosition;
  final LinearElementPosition tickPosition;
  final bool showMajorTicks;
  final bool showMinorTicks;
  final bool showAxisTrack;
  final bool showAxisLabel;
  final ValueToMajorTickStyleCallback? valueToMajorTickStyleCallback;
  final GaugeValue? value;
  final LinearNeedle? needle;
  final List<FillAreaPointer>? fillAreaPointers;
  final ValueToLabelStyleCallback? valueToLabelStyleCallback;
  _ScaleLinearGaugePainter({
    required this.gaugeType,
    required this.orientation,
    required this.minimum,
    required this.maximum,
    required this.interval,
    required this.axisSpaceExtent,
    required this.axisLabelStyle,
    required this.axisTrackStyle,
    required this.minorTicksPerInterval,
    required this.majorTickStyle,
    required this.minorTickStyle,
    required this.labelPosition,
    required this.tickPosition,
    required this.showMajorTicks,
    required this.showMinorTicks,
    required this.showAxisTrack,
    required this.showAxisLabel,
    this.ranges,
    this.barPointers,
    this.markerPointers,
    this.valueToLabelFormatCallback,
    this.valueToMajorTickStyleCallback,
    this.value,
    this.needle,
    this.fillAreaPointers,
    this.valueToLabelStyleCallback,
  });

  @override
  void paint(Canvas canvas, Size size) {
    switch (gaugeType) {
      case ScaleLinearGaugeType.defaultGauge:
        _drawDefaultGauge(canvas, size);
        break;
      case ScaleLinearGaugeType.exponential:
        _drawExponentialGauge(canvas, size);
        break;
      case ScaleLinearGaugeType.concave:
        _drawConcaveGauge(canvas, size);
        break;
      case ScaleLinearGaugeType.gradient:
        _drawGradientGauge(canvas, size);
        break;
      case ScaleLinearGaugeType.multiRange:
        _drawMultiRangeGauge(canvas, size);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _ScaleLinearGaugePainter oldDelegate) {
    return true; // Update as needed for performance
  }

  void _drawConcaveGauge(Canvas canvas, Size size) {
    final Paint trackPaint = Paint()
      ..color = axisTrackStyle.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = axisTrackStyle.thickness;

    final double startX = axisSpaceExtent;
    final double endX = size.width - axisSpaceExtent;
    final double centerY = size.height / 2;

    final Path path = Path()
      ..moveTo(startX, centerY)
      ..quadraticBezierTo(
        size.width / 2,
        centerY - (size.height / 2),
        endX,
        centerY,
      );

    canvas.drawPath(path, trackPaint);

    // Draw ticks and labels if needed
    // _drawTicksAndLabelsOnPath(canvas, path);
  }

  // Implement drawing methods for each gauge type
  void _drawDefaultGauge(Canvas canvas, Size size) {
    final double startX = axisSpaceExtent;
    final double endX = size.width - axisSpaceExtent;
    if (showAxisTrack) {
      final Paint trackPaint = Paint()
        ..color = axisTrackStyle.color
        ..strokeWidth = axisTrackStyle.thickness
        ..style = axisTrackStyle.paintingStyle
        ..strokeCap = axisTrackStyle.strokeCap;

      // Draw the axis line
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        trackPaint,
      );
    }

    // Draw ticks and labels
    _drawTicksAndLabels(canvas, size, startX, endX);

    // Draw Needle
    _drawNeedle(canvas, size);

    // Draw Marker Pointer
    _drawLinearMarkerPointer(canvas, size);

    // Draw the filled area between two ticks
    _drawFilledArea(canvas, size);
  }

  void _drawExponentialGauge(Canvas canvas, Size size) {
    // Similar to default gauge, but vary the thickness exponentially
    final Paint trackPaint = Paint()
      ..strokeWidth = axisTrackStyle.thickness
      ..style = PaintingStyle.stroke;

    final double startX = axisSpaceExtent;
    final double endX = size.width - axisSpaceExtent;

    final Path path = Path();
    path.moveTo(startX, size.height / 2);

    for (double x = startX; x <= endX; x += 1) {
      final double progress = (x - startX) / (endX - startX);
      final double exponentialThickness =
          axisTrackStyle.thickness * math.pow(progress, 2);

      trackPaint.strokeWidth = exponentialThickness;

      if (x > startX) {
        canvas.drawLine(
          Offset(x - 1, size.height / 2),
          Offset(x, size.height / 2),
          trackPaint,
        );
      }
    }

    // Draw ticks and labels if needed
    _drawTicksAndLabels(canvas, size, startX, endX);
  }

  void _drawFilledArea(Canvas canvas, Size size) {
    if (fillAreaPointers == null) {
      return;
    }

    for (final FillAreaPointer fillAreaPointer in fillAreaPointers!) {
      if (kDebugMode) {
        log('GxScaleLinearGauge: Fill Area Pointer: ${fillAreaPointer.startValue} - ${fillAreaPointer.endValue}');
      }
      final double startFillValue = fillAreaPointer.startValue;
      final double endFillValue = fillAreaPointer.endValue;
      final Color fillColor = fillAreaPointer.color;
      final double axisThickness = fillAreaPointer.thickness;
      final double totalRange = maximum - minimum;
      final double startRatio = (startFillValue - minimum) / totalRange;
      final double endRatio = (endFillValue - minimum) / totalRange;

      final double startX = startRatio * size.width;
      final double endX = endRatio * size.width;

      final Paint fillPaint = Paint()
        ..color = fillColor
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.butt
        ..strokeWidth = axisThickness;

      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(endX, size.height / 2),
        fillPaint,
      );
    }
  }

  void _drawGradientGauge(Canvas canvas, Size size) {
    // Implement drawing methods for each gauge type
  }

  void _drawLinearMarkerPointer(Canvas canvas, Size size) {
    if (markerPointers != null && markerPointers!.isNotEmpty) {
      for (final LinearMarkerPointer markerPointer in markerPointers!) {
        final double markerX = size.width / 2;
        final double markerY = size.height / 2;

        // Draw the marker
        if (kDebugMode) {
          log('GxScaleLinearGauge: Marker Pointer: markerX: $markerX, markerY: $markerY');
        }

        // Check Needle is enabled
        if (markerPointer.needle != null && markerPointer.needle!.enabled) {
          // Draw the needle
          NeedleUtils.drawIt(
              canvas: canvas,
              size: size,
              maxValue: maximum,
              minValue: minimum,
              value: markerPointer.value,
              needle: markerPointer.needle!,
              thickness: markerPointer.needle!.offset,
              dense: true);
        }
      }
    }
  }

  void _drawMultiRangeGauge(Canvas canvas, Size size) {}

  void _drawNeedle(Canvas canvas, Size size) {
    if (needle != null && value != null) {
      // Draw the needle if enabled
      if (needle!.enabled) {
        // Draw the needle
        NeedleUtils.drawIt(
            canvas: canvas,
            size: size,
            maxValue: maximum,
            minValue: minimum,
            value: value!.value,
            needle: needle!,
            thickness: needle!.offset,
            dense: true);
      }
    }
  }

  void _drawTicksAndLabels(
      Canvas canvas, Size size, double startX, double endX) {
    // Get the total interval from the minimum and maximum values
    final double totalInterval = maximum - minimum;

    // Calculate the actual interval from the total interval and the interval value
    final double actualInterval = interval ?? totalInterval / 10;

    // Calculate the number of divisions based on the actual interval and the total interval
    final int divisions = (totalInterval / actualInterval).floor();

    // Calculate the tick spacing based on the start and end x values and the number of divisions
    final double tickSpacing = (endX - startX) / divisions;

    for (int i = 0; i <= divisions; i++) {
      // Determine if the current tick is odd or even
      final bool isOdd = (minimum + i) % 2 != 0;

      final double x = startX + (tickSpacing * i);

      // P1: Start Point and Vertical Up Line from X Axis
      // P2: End Point and Vertical Down Line from X Axis

      // Default cross
      Offset majorTickP1 =
          Offset(x, size.height / 2 - majorTickStyle.length / 2);
      Offset majorTickP2 =
          Offset(x, size.height / 2 + majorTickStyle.length / 2);
      double minorP1dY = size.height / 2 - minorTickStyle.length / 2;
      double minorP2dY = size.height / 2 + minorTickStyle.length / 2;

      if (tickPosition == LinearElementPosition.inside) {
        // Horizontal: Start From Top and Hide Bottom
        majorTickP2 =
            Offset(x, size.height / 2 - (axisTrackStyle.thickness / 2));

        minorP2dY = size.height / 2 - axisTrackStyle.thickness / 2;
      } else if (tickPosition == LinearElementPosition.outside) {
        // Horizontal: Start From Bottom
        majorTickP1 =
            Offset(x, size.height / 2 + (axisTrackStyle.thickness / 2));

        minorP1dY = size.height / 2 + axisTrackStyle.thickness / 2;
      } else if (tickPosition == LinearElementPosition.outAndIn) {
        // Determine if the current tick should go up or down
        if (isOdd) {
          // Horizontal: Start From Top and Hide Bottom
          majorTickP2 =
              Offset(x, size.height / 2 - (axisTrackStyle.thickness / 2));
        } else {
          majorTickP1 =
              Offset(x, size.height / 2 + (axisTrackStyle.thickness / 2));
        }
      } else if (tickPosition == LinearElementPosition.inAndOut) {
        // Determine if the current tick should go up or down
        if (isOdd) {
          // Horizontal: Start From Bottom
          majorTickP1 =
              Offset(x, size.height / 2 + (axisTrackStyle.thickness / 2));
        } else {
          majorTickP2 =
              Offset(x, size.height / 2 - (axisTrackStyle.thickness / 2));
        }
      }

      // Filter Major Tick Style based on the value and index
      final LinearTickStyle filterMajorTickStyle =
          valueToMajorTickStyleCallback != null
              ? valueToMajorTickStyleCallback!(minimum + actualInterval * i, i)
              : majorTickStyle;

      // Draw major tick
      canvas.drawLine(
        majorTickP1,
        majorTickP2,
        Paint()
          ..color = filterMajorTickStyle.color
          ..strokeWidth = filterMajorTickStyle.thickness,
      );

      // Draw minor ticks
      if (showMinorTicks) {
        if (minorTicksPerInterval > 0 && i < divisions) {
          final double minorTickSpacing =
              tickSpacing / (minorTicksPerInterval + 1);
          for (int j = 1; j <= minorTicksPerInterval; j++) {
            final double minorX = x + (minorTickSpacing * j);
            canvas.drawLine(
              Offset(minorX, minorP1dY),
              Offset(minorX, minorP2dY),
              Paint()
                ..color = minorTickStyle.color
                ..strokeWidth = minorTickStyle.thickness,
            );
          }
        }
      }

      // Draw labels
      if (showAxisLabel) {
        final TextStyle labelStyle = valueToLabelStyleCallback != null
            ? valueToLabelStyleCallback!(minimum + actualInterval * i, i)
            : axisLabelStyle ??
                const TextStyle(color: Colors.black, fontSize: 12);
        // Check Tick Position is InAndOut
        final bool isTickPositionOutInAndTickIsOdd =
            tickPosition == LinearElementPosition.outAndIn && isOdd;
        final bool isTickPositionInOutAndTickIsEven =
            tickPosition == LinearElementPosition.inAndOut && !isOdd;

        final bool isLabelPositionTopCenter =
            labelPosition == LinearGaugeLabelPosition.topCenter;

        final bool showLabelOnTop = isTickPositionOutInAndTickIsOdd ||
            isLabelPositionTopCenter ||
            isTickPositionInOutAndTickIsEven;

        final TextPainter textPainter = TextPainter(
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            textWidthBasis: TextWidthBasis.longestLine);
        final String label = (minimum + actualInterval * i).toStringAsFixed(0);
        textPainter
          ..text = TextSpan(
            text: valueToLabelFormatCallback != null
                ? valueToLabelFormatCallback!(label, i)
                : label,
            style: labelStyle,
          )
          ..layout();

        if (showLabelOnTop) {
          textPainter.paint(
            canvas,
            Offset(
              x - textPainter.width / 2,
              size.height / 2 -
                  majorTickStyle.length / 2 -
                  4 -
                  textPainter.height,
            ),
          );
        } else {
          textPainter.paint(
            canvas,
            Offset(
              x - textPainter.width / 2,
              size.height / 2 + majorTickStyle.length / 2 + 4,
            ),
          );
        }
      }
    }
  }
}
