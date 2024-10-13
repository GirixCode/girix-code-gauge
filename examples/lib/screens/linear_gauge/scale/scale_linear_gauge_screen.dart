import 'package:examples/screens/linear_gauge/scale/components/default_linear_gauges.dart';
import 'package:examples/screens/linear_gauge/scale/components/exponential_linear_gauges.dart';
import 'package:flutter/material.dart';

class MyScaleLinearGaugeScreen extends StatefulWidget {
  const MyScaleLinearGaugeScreen({super.key});

  @override
  State<MyScaleLinearGaugeScreen> createState() =>
      _MyScaleLinearGaugeScreenState();
}

class _MyScaleLinearGaugeScreenState extends State<MyScaleLinearGaugeScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Linear Gauge'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          padding: EdgeInsets.zero,
          // labelPadding: EdgeInsets.zero,
          tabAlignment: TabAlignment.start,
          tabs: const <Widget>[
            Tab(
              text: 'Default',
              // child: Text('Default'),
            ),
            Tab(
              child: Text('Expontential'),
            ),
            Tab(
              child: Text('Concave'),
            ),
            Tab(
              child: Text('Gradient'),
            ),
            Tab(
              child: Text('Multi Range'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        physics: const ClampingScrollPhysics(),
        controller: _tabController,
        children: const <Widget>[
          DefaultScaleLinearGaugeBody(),
          ExponentialScaleLinearGaugeBody(),
          Center(
            child: Text("It's multi range here"),
          ),
          Center(
            child: Text("It's gradient here"),
          ),
          Center(
            child: Text("It's multi range here"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
}
