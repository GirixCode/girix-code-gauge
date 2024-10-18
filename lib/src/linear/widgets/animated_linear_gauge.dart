// lib/src/linear/widgets/animated_progress_linear_gauge.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';

class AnimatedProgressLinearGauge extends StatefulWidget {
  final double value;
  final GaugeAnimationType animationType;
  final Duration duration;
  final LinearGaugeStyle foregroundStyle;
  final LinearGaugeStyle backgroundStyle;
  final LinearNeedle? needle;
  final void Function(Canvas canvas, Offset position)? customDrawNeedle;
  const AnimatedProgressLinearGauge({
    super.key,
    required this.value,
    this.animationType = GaugeAnimationType.linear,
    this.duration = const Duration(milliseconds: 1000),
    required this.foregroundStyle,
    required this.backgroundStyle,
    this.needle,
    this.customDrawNeedle,
  });

  @override
  _AnimatedProgressLinearGaugeState createState() =>
      _AnimatedProgressLinearGaugeState();
}

class _AnimatedProgressLinearGaugeState
    extends State<AnimatedProgressLinearGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldValue = 0.0;

  @override
  Widget build(BuildContext context) {
    log('ProgressLinearGauge: [Animated] ${_animation.value}');
    return ProgressLinearGauge(
      value: GaugeValue(value: _animation.value),
      foregroundStyle: widget.foregroundStyle,
      backgroundStyle: widget.backgroundStyle,
      needle: widget.needle,
      customDrawNeedle: widget.customDrawNeedle,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedProgressLinearGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value ||
        oldWidget.animationType != widget.animationType) {
      _oldValue = oldWidget.value;
      _controller.reset();
      _animation = _createAnimation(_oldValue, widget.value);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _oldValue = 0;
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = _createAnimation(_oldValue, widget.value);
    _controller.forward();
  }

  Animation<double> _createAnimation(double begin, double end) {
    Curve curve;
    switch (widget.animationType) {
      case GaugeAnimationType.easeIn:
        curve = Curves.easeIn;
        break;
      case GaugeAnimationType.easeOut:
        curve = Curves.easeOut;
        break;
      case GaugeAnimationType.easeInOut:
        curve = Curves.easeInOut;
        break;
      case GaugeAnimationType.bounce:
        curve = Curves.bounceInOut;
        break;
      case GaugeAnimationType.elastic:
        curve = Curves.elasticOut;
        break;
      case GaugeAnimationType.linear:
        curve = Curves.linear;
        break;
    }

    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: _controller, curve: curve),
    )..addListener(() {
        setState(() {});
      });
  }
}
