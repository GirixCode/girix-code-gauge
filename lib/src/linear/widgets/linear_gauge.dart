// // lib/src/linear/widgets/linear_gauge.dart

// import 'package:flutter/material.dart';
// import 'package:girix_shape/src/common/models/enums.dart';
// import 'package:girix_shape/src/common/models/gauge_value.dart';
// import 'package:girix_shape/src/linear/models/linear_gauge_style.dart';
// import 'package:girix_shape/src/linear/models/linear_needle_model.dart';
// import 'package:girix_shape/src/linear/painters/linear_gauge_painter.dart';

// /// The [LinearGauge] widget is used to display a linear gauge.
// ///
// /// The [LinearGauge] widget requires the following properties:
// ///
// /// - [value]: An instance of the [GaugeValue] class that holds the value of the gauge.
// ///
// /// - [style]: An instance of the [LinearGaugeStyle] class that holds the style properties of the gauge.
// ///
// /// - [shape]: An instance of the [LinearGaugeShape] enum that holds the shape of the gauge.
// ///
// /// - [needle]: An instance of the [LinearNeedle] class that holds the needle properties of the Needle.
// class LinearGauge extends StatelessWidget {
//   final GaugeValue value;
//   final LinearGaugeStyle? foregroundStyle;
//   final LinearGaugeStyle? backgroundStyle;
//   final LinearGaugeShape shape;
//   final LinearNeedle? needle;
//   const LinearGauge(
//       {super.key,
//       required this.value,
//       this.foregroundStyle,
//       this.backgroundStyle,
//       this.shape = LinearGaugeShape.progress,
//       this.needle})
//       :
//         // Both styles can not be null
//         assert(foregroundStyle != null || backgroundStyle != null);

//   @override
//   Widget build(BuildContext context) {
//     // Get default size from MediaQuery

//     final LinearGaugeStyle style = backgroundStyle ??
//         foregroundStyle ??
//         LinearGaugeStyle(size: Size(MediaQuery.sizeOf(context).width, 10));
//     return SizedBox(
//       width: style.size.width,
//       height: style.size.height,
//       child: CustomPaint(
//         size: style.size,
//         painter: getPainter(style),
//       ),
//     );
//   }

//   // Get Painter based on the shape
//   CustomPainter getPainter(LinearGaugeStyle defaultStyle) {
//     final LinearNeedle needle = this.needle ?? const LinearNeedle();
//     switch (shape) {
//       case LinearGaugeShape.progress:
//         return LinearGaugeProgressPainter(
//             foregroundStyle: foregroundStyle ?? defaultStyle,
//             backgroundStyle: backgroundStyle ?? defaultStyle,
//             gaugeValue: value,
//             needle: needle);

//       case LinearGaugeShape.defaultGauge:
//       case LinearGaugeShape.segmentedColor:
//       case LinearGaugeShape.gradientColor:
//       case LinearGaugeShape.pyramid:
//       case LinearGaugeShape.triangleMarker:
//       case LinearGaugeShape.blockSegments:
//       case LinearGaugeShape.bandedColor:
//       case LinearGaugeShape.barWithMarker:
//       case LinearGaugeShape.horizontalStrip:
//       case LinearGaugeShape.thickSegmented:
//       case LinearGaugeShape.arrowPointer:
//       case LinearGaugeShape.flatMinimal:
//         return LinearGaugeProgressPainter(
//             foregroundStyle: foregroundStyle ?? defaultStyle,
//             backgroundStyle: backgroundStyle ?? defaultStyle,
//             gaugeValue: value,
//             needle: needle);
//     }
//   }
// }
