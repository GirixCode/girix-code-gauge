import 'package:flutter/material.dart';
import 'package:girix_code_gauge/gauges.dart';

class MyBarLinearGaugeScreen extends StatefulWidget {
  const MyBarLinearGaugeScreen({super.key});

  @override
  State<MyBarLinearGaugeScreen> createState() => _MyBarLinearGaugeScreenState();
}

class _MyBarLinearGaugeScreenState extends State<MyBarLinearGaugeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Linear Gauge'),
      ),
      body: ListView(
        children: [
          buildCard(
              'Default Linear Bar Gauge',
              GxLinearBarGauge(
                size: Size(width, 40),
                value: const GaugeValue(value: 60, max: 99),
                barPointers: [
                  LinearBarPointer(value: 33, thickness: 5, color: Colors.teal),
                  LinearBarPointer(
                      color: Colors.lightBlue, value: 33, thickness: 5),
                  LinearBarPointer(
                      color: Colors.cyanAccent, value: 33, thickness: 5),
                ],
              )),
          buildCard(
              "With Gap Between Bars",
              GxLinearBarGauge(
                size: const Size(410, 40),
                value: const GaugeValue(
                  value: 60,
                  min: 0,
                  max: 100,
                ),
                gapBetweenBars: 6,
                barPointers: [
                  LinearBarPointer(
                      value: 25, thickness: 5, color: Colors.green),
                  LinearBarPointer(
                      color: Colors.redAccent, value: 25, thickness: 5),
                  LinearBarPointer(
                      color: Colors.amber, value: 25, thickness: 5),
                  LinearBarPointer(
                      color: Colors.blueAccent, value: 25, thickness: 5),
                ],
              )),

          const SizedBox(height: 10),
          // Customized Bar Gauge Style with Gap
          buildCard(
              "Customized Bar Gauge Style with Gap",
              GxLinearBarGauge(
                size: const Size(410, 40),
                value: const GaugeValue(
                  value: 130,
                  min: 0,
                  max: 200,
                ),
                gapBetweenBars: 10,
                barPointers: [
                  LinearBarPointer(
                      value: 20,
                      thickness: 5,
                      color: Colors.green,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(20)),
                  LinearBarPointer(
                      color: Colors.orange,
                      value: 130,
                      thickness: 5,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(2)),
                  LinearBarPointer(
                      color: Colors.brown,
                      value: 50,
                      thickness: 5,
                      strokeCap: StrokeCap.round,
                      paintingStyle: PaintingStyle.fill,
                      radius: const Radius.circular(2)),
                ],
              )),
          const SizedBox(height: 10),
          buildCard(
              "With a needle and Gap",
              GxLinearBarGauge(
                size: const Size(410, 25),
                value: const GaugeValue(
                  value: 70,
                  min: 0,
                  max: 100,
                ),
                gapBetweenBars: 5,
                needle: const LinearNeedle(
                    enabled: true,
                    color: Colors.blueGrey,
                    size: Size(1.5, 75),
                    position: LinearGaugeNeedlePosition.bottom,
                    needleType: LinearGaugeNeedleType.pipe),
                barPointers: [
                  LinearBarPointer(
                      // strokeCap: StrokeCap.square,
                      // paintingStyle: PaintingStyle.stroke,
                      radius: const Radius.circular(5),
                      value: 75,
                      thickness: 5,
                      color: Colors.blueGrey.shade300),
                  LinearBarPointer(
                      radius: const Radius.circular(5),
                      color: Colors.blueGrey,
                      value: 25,
                      thickness: 5),
                  // LinearBarPointer(
                  //     color: Colors.blueGrey.shade600, value: 50, thickness: 5),
                ],
              )),

          const SizedBox(height: 10),
          buildCard(
              'With Labels',
              GxLinearBarGauge(
                size: Size(width, 40),
                value: const GaugeValue(
                  value: 60,
                  min: 0,
                  max: 100,
                ),
                barPointers: [
                  LinearBarPointer(
                      label: const GaugeLabel(
                        label: 'Low',
                      ),
                      value: 20,
                      thickness: 5,
                      color: Colors.deepOrangeAccent),
                  LinearBarPointer(
                      label: const GaugeLabel(
                        label: 'Medium',
                      ),
                      color: Colors.yellow.shade800,
                      value: 50,
                      thickness: 5),
                  LinearBarPointer(
                      label: const GaugeLabel(
                        label: 'High',
                      ),
                      color: Colors.greenAccent.shade700,
                      value: 30,
                      thickness: 5),
                ],
              )),

          // const SizedBox(height: 10),
          // buildCard(
          //     'With TextAlign and Offset of Labels',
          //     GxLinearBarGauge(
          //       size: Size(width, 40),
          //       value: const GaugeValue(
          //         value: 60,
          //         min: 0,
          //         max: 100,
          //       ),
          //       gapBetweenBars: 5,
          //       barPointers: [
          //         LinearBarPointer(
          //             label: const GaugeLabel(
          //                 style: TextStyle(color: Colors.black87),
          //                 label: 'TextAlign',
          //                 textAlign: TextAlign.end),
          //             value: 20,
          //             thickness: 2,
          //             paintingStyle: PaintingStyle.stroke,
          //             color: Colors.black45),
          //         LinearBarPointer(
          //             paintingStyle: PaintingStyle.stroke,
          //             label: const GaugeLabel(
          //                 offset: Offset(0, -10),
          //                 style: TextStyle(color: Colors.black87),
          //                 label: 'Offset',
          //                 textAlign: TextAlign.center),
          //             color: Colors.black45,
          //             value: 50,
          //             thickness: 2),
          //         LinearBarPointer(
          //             paintingStyle: PaintingStyle.stroke,
          //             label: const GaugeLabel(
          //               label: 'Default',
          //               style: TextStyle(color: Colors.black87),
          //             ),
          //             color: Colors.black45,
          //             value: 30,
          //             thickness: 2),
          //       ],
          //     )),

          const SizedBox(height: 10),
          // Tooltip
          buildCard(
              'With Tooltip',
              GxLinearBarGauge(
                size: Size(width, 40),
                value: const GaugeValue(
                  value: 85,
                  min: 0,
                  max: 100,
                ),
                // gapBetweenBars: 5,
                tooltip: const GaugeTooltip(
                  enabled: true,
                  color: Colors.black12,
                  borderColor: Colors.redAccent,
                  radius: Radius.circular(5),
                  offset: 20,
                  type: GaugeTooltipType.normal,
                  position: GaugeTooltipPosition.top,
                  paintingStyle: PaintingStyle.stroke,
                  thickness: 1.0,
                  size: Size(40, 20),
                  textStyle: TextStyle(),
                ),
                barPointers: [
                  LinearBarPointer(
                      label: const GaugeLabel(
                        style: TextStyle(color: Colors.black87),
                        label: 'Documents',
                      ),
                      value: 33,
                      thickness: 2,
                      paintingStyle: PaintingStyle.stroke,
                      color: Colors.black45),
                  LinearBarPointer(
                      paintingStyle: PaintingStyle.stroke,
                      label: const GaugeLabel(
                          style: TextStyle(color: Colors.black87),
                          label: 'Developers',
                          textAlign: TextAlign.center),
                      color: Colors.black45,
                      value: 34,
                      thickness: 2),
                  LinearBarPointer(
                      paintingStyle: PaintingStyle.stroke,
                      label: const GaugeLabel(
                        label: 'System',
                        style: TextStyle(color: Colors.black87),
                      ),
                      color: Colors.black45,
                      value: 33,
                      thickness: 2),
                ],
              ),
              height: 120),
          const SizedBox(height: 10),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildCard(
    String title,
    Widget child, {
    double? height,
  }) {
    return Card(
      elevation: 0.1,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 10),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
