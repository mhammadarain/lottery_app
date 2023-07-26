import 'package:flutter/material.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(LotteryApp());
}

class LotteryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LotteryScreen(),
    );
  }
}

class LotteryScreen extends StatefulWidget {
  @override
  _LotteryScreenState createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
   int generatedNumber = 0;
  bool showRetryButton = false;

  void generateRandomNumber() {
    setState(() {
      generatedNumber = Random().nextInt(10) + 1;
      showRetryButton = true;
    });
  }

  void retry() {
    setState(() {
      showRetryButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottery App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Generated Number:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              generatedNumber != null ? generatedNumber.toString() : '',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (showRetryButton)
              ElevatedButton(
                onPressed: retry,
                child: Text('Retry'),
              ),
            if (!showRetryButton)
              ElevatedButton(
                onPressed: generateRandomNumber,
                child: Text('Generate Number'),
              ),
          ],
        ),
      ),
    );
  }
}
