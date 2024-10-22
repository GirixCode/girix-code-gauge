import 'package:examples/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';

class MultiRangeScaleLinearGaugeBody extends StatefulWidget {
  const MultiRangeScaleLinearGaugeBody({super.key});

  @override
  State<MultiRangeScaleLinearGaugeBody> createState() =>
      _MultiRangeScaleLinearGaugeBodyState();
}

class _MultiRangeScaleLinearGaugeBodyState
    extends State<MultiRangeScaleLinearGaugeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.all(8),
      key: const Key('scale_linear_gauge_list'),
      children: [
        ItemCard(
          title: 'With Tick outside',
          child: GxScaleLinearGauge(
              height: 60,
              minimum: 0,
              maximum: 100,
              interval: 20,
              minorTicksPerInterval: 5,
              axisSpaceExtent: 2,
              labelPosition: LinearGaugeLabelPosition.topCenter,
              tickPosition: LinearElementPosition.outside,
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 3,
              ),
              majorTickStyle: const LinearTickStyle(
                length: 50,
                thickness: 2,
              ),
              minorTickStyle: const LinearTickStyle(
                length: 30,
                thickness: 1,
              ),
              markerPointers: [
                LinearMarkerPointer(
                  value: 50,
                  marker: const Icon(Icons.circle, color: Colors.red, size: 10),
                ),
              ],
              // barHeight: 20,
              barOffset: 1,
              barPointers: [
                LinearBarPointer(
                    label: const GaugeLabel(label: 'Low'),
                    value: 33,
                    thickness: 5,
                    color: Colors.brown),
                LinearBarPointer(
                    label: const GaugeLabel(label: 'Medium'),
                    color: Colors.yellow.shade700,
                    value: 33,
                    thickness: 5),
                LinearBarPointer(
                    label: const GaugeLabel(label: 'High'),
                    color: Colors.cyan.shade700,
                    value: 33,
                    thickness: 5),
              ]),
        ),
        ItemCard(
          title: 'With Tick inside',
          child: GxScaleLinearGauge(
              height: 80,
              tickPosition: LinearElementPosition.inside,
              labelPosition: LinearGaugeLabelPosition.bottomCenter,
              minorTickStyle: const LinearTickStyle(
                length: 20,
                thickness: 1,
              ),
              majorTickStyle: const LinearTickStyle(
                length: 40,
                thickness: 1,
              ),
              axisTrackStyle: const LinearAxisTrackStyle(
                thickness: 2,
                strokeCap: StrokeCap.round,
              ),
              // showAxisLabel: false,
              // showAxisTrack: false,
              barHeight: 30,
              barOffset: 0,
              barPointers: [
                LinearBarPointer(
                    label: const GaugeLabel(
                        label: 'Developer',
                        style: TextStyle(color: Colors.black87)),
                    value: 33,
                    thickness: 5,
                    color: Colors.orangeAccent.shade400),
                LinearBarPointer(
                    label: const GaugeLabel(
                        label: 'Designer',
                        style: TextStyle(color: Colors.black87)),
                    color: Colors.tealAccent,
                    value: 33,
                    thickness: 5),
                LinearBarPointer(
                    label: const GaugeLabel(
                        label: 'Tester',
                        style: TextStyle(color: Colors.black87)),
                    color: Colors.orangeAccent,
                    value: 33,
                    thickness: 5),
              ]),
        ),
      ],
    );
  }
}
