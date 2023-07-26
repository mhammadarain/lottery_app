import 'dart:math';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LotteryScreen(),
      home: const MyHomePage(title: 'LOTTERY APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Random random = Random();
int x = 7;

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Lottery Winning No: is $x",
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 25),)),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(22),
            ),
            child:x==5?  Column(children: [
              Icon(Icons.warning_amber, size: 50,color: Colors.red,),
              SizedBox(height: 20,),
              Text("Better Luck Next Time \n Your no: is 5 \n Try Again",
                textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ],):
            Column(children: [
              Icon(Icons.warning_amber, size: 50,color: Colors.red,),
              SizedBox(height: 20,),
    ReadMoreText(
    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
    trimLines: 2,
    colorClickableText: Colors.yellow,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Show more',
    trimExpandedText: 'Show less',
    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.yellow) ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
    ),
              // Text("Better Luck Next Time \n Your no: is 5 \n Try Again",
              //   textAlign: TextAlign.center,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
    ],),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          x=random.nextInt(10);
          print(x);
          setState(() {

          });
        },
        child: const Icon(FontAwesomeIcons.gamepad),
      ),// T// his trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
