enum GaugeTooltipPosition {
  /// Tooltip position at the top of the gauge
  top,

  /// Tooltip position at the bottom of the gauge
  bottom,
}

enum GaugeTooltipType {
  /// Shows the tooltip for the gauge
  normal,

  /// Shows the tooltip for the gauge in a floating position
  floatDock,
}

enum LinearElementPosition {
  /// Element position inside the gauge bounds
  ///
  /// Horizontal: top of the Gauge.
  ///
  /// Vertical: Right of the Gauge.
  inside,

  /// Element position outside the gauge bounds.
  /// Horizontal: bottom of the Gauge.
  ///
  /// Vertical: Left of the Gauge.
  outside,

  /// Element position at the start of the gauge
  ///
  cross,

  /// Element position
  inAndOut,

  /// Element position
  outAndIn,
}

enum LinearGaugeAxisPosition { start, end, center }

enum LinearGaugeDirection { horizontal, vertical }

enum LinearGaugeLabelPosition {
  // topRight,
  // topLeft,
  // bottomRight,
  // bottomLeft,
  topCenter,
  bottomCenter,
}

enum LinearGaugeNeedlePosition {
  top,

  /// Needle position at the start of the gauge
  bottom,

  /// Needle position at the end of the gauge
  center

  /// Needle position at the center of the gauge
}

/// Enum for the type of needle to be used in the gauge
/// The needle can be a circle, triangle, diamond, rectangle, or a custom shape
enum LinearGaugeNeedleType {
  /// Custom needle type such as this ✒
  custom,

  /// Circle needle type such as this ●
  circle,

  /// Triangle needle type such as this ▲
  triangle,

  /// Diamond needle type such as this ◆
  diamond,

  /// Rectangle needle type such as this ■
  rectangle,

  /// Pipe needle type such as this |
  pipe
}

enum LinearGaugeOrientation {
  horizontal,
  vertical,
}

enum ScaleLinearGaugeType {
  defaultGauge,
  exponential,
  concave,
  gradient,
  multiRange,
}
