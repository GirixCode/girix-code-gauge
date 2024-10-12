import 'dart:developer';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:girix_shape/girix_shape.dart';

class NeedleUtils {
  static void drawNeedle(
      {required Canvas canvas,
      required Size size,
      required GaugeValue gaugeValue,
      bool dense = false,
      required LinearGaugeStyle style,
      required LinearNeedle needle,
      void Function(Canvas canvas, Offset position)? customDrawNeedle}) {
    // Calculate the needle's x-position based on the needle position
    final double progress = ((gaugeValue.value - gaugeValue.min) /
            (gaugeValue.max - gaugeValue.min))
        .clamp(0.0, 1.0);

    // To allign nnedle with center position 0: Start after progress
    final double denseValue = dense ? -5 : needle.size.width / 2;
    final double needleX = (size.width * progress) - denseValue;
    double needleY = size.height / 2;

    if (kDebugMode) {
      log('ProgressLinearGauge: Before needleX: $needleX and needleY: $needleY and progress: $progress');
    }

    final LinearGaugeNeedlePosition needlePosition = needle.position;
    final Color needleColor = needle.color;
    final double needleWidthSize = needle.size.width;
    final LinearGaugeNeedleType needleType = needle.needleType;

    //    |
    // -------- X+
    //    | Y+ needle
    log('ProgressLinearGauge: needlePosition: $needlePosition');
    switch (needlePosition) {
      case LinearGaugeNeedlePosition.top:
        needleY = style.dense ? style.thickness : -style.thickness;
        break;
      case LinearGaugeNeedlePosition.bottom:
        if (style.dense && size.height > style.thickness) {
          needleY = size.height - style.thickness;
        } else {
          needleY = size.height + style.thickness;
        }
        break;
      case LinearGaugeNeedlePosition.center:
        // Use the calculated needleX based on the value
        // needleX = size.height / 2;
        break;
    }

    if (kDebugMode) {
      log('ProgressLinearGauge: After needleX: $needleX and needleY: $needleY height: ${size.height}');
    }

    final Paint needlePaint = Paint()
      ..color = needleColor
      ..style = PaintingStyle.fill;

    switch (needleType) {
      case LinearGaugeNeedleType.circle:
        canvas.drawCircle(
            Offset(needleX, needleY), needleWidthSize / 2, needlePaint);
        break;
      case LinearGaugeNeedleType.triangle:
        final Path trianglePath = Path();
        trianglePath.moveTo(needleX, needleY - needleWidthSize / 2);
        trianglePath.lineTo(
            needleX - needleWidthSize / 2, needleY + needleWidthSize / 2);
        trianglePath.lineTo(
            needleX + needleWidthSize / 2, needleY + needleWidthSize / 2);
        trianglePath.close();
        canvas.drawPath(trianglePath, needlePaint);
        break;
      case LinearGaugeNeedleType.diamond:
        final Path diamondPath = Path();
        diamondPath.moveTo(needleX, needleY - needleWidthSize / 2);
        diamondPath.lineTo(needleX - needleWidthSize / 2, needleY);
        diamondPath.lineTo(needleX, needleY + needleWidthSize / 2);
        diamondPath.lineTo(needleX + needleWidthSize / 2, needleY);
        diamondPath.close();
        canvas.drawPath(diamondPath, needlePaint);
        break;
      case LinearGaugeNeedleType.rectangle:
        final Rect rect = Rect.fromCenter(
          center: Offset(needleX, needleY),
          width: needleWidthSize,
          height: needleWidthSize,
        );
        canvas.drawRect(rect, needlePaint);
        break;
      case LinearGaugeNeedleType.custom:
        if (customDrawNeedle != null) {
          customDrawNeedle(canvas, Offset(needleX, needleY));
        }
        break;
      case LinearGaugeNeedleType.pipe:
        final Rect rect = Rect.fromCenter(
          center: Offset(needleX, needleY),
          width: needleWidthSize,
          height: needle.size.height,
        );
        canvas.drawRect(rect, needlePaint);
        break;
    }
  }
}
