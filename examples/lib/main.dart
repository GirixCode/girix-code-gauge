// example/lib/main.dart

import 'dart:async';

import 'package:examples/screens/progress_linear_gauge.dart';
import 'package:examples/screens/scale_linear_gauge_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  bool reRender = true;

  late final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Girix Shape Example',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Girix Shape Example'),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  refreshPage();
                },
              )
            ],
          ),
          body: reRender
              ? ListView(
                  controller: _scrollController,
                  // physics: const ClampingScrollPhysics(),
                  // shrinkWrap: true,
                  children: const [
                    MyProgressLinearGauge(),
                    SizedBox(height: 100),
                    MyScaleLinearGaugeScreen()
                  ],
                )
              : const Center(
                  child: Text('Click on the refresh icon to reload the page'),
                )),
    );
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
  }

  void refreshPage() {
    setState(() {
      reRender = !reRender;
    });

    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        reRender = !reRender;
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToBottom();
      });
    });
  }

  // Scroll to the last item in the list
  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}
