// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const customSwatch = MaterialColor(
    0xFFFF5252,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(0xFFFF5252),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customSwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var textGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto Size Text"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
        child: ListView(
          children: [
            /// AUTO SIZE TEXT EXAMPLE
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4.0, style: BorderStyle.solid, color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('This String will be automatically resized to fit on two lines.',
                      style: TextStyle(fontSize: 20),
                      maxLines: 2,
                    ),
                    SizedBox(height: 20,),
                    AutoSizeText(
                      'This String will be automatically resized to fit on two lines.',
                      style: TextStyle(fontSize: 20),
                      maxLines: 2,
                      /// other variables
                      //presetFontSizes: [40, 20, 14],
                      //overflowReplacement: Text('Sorry String too long'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            /// GROUP EXAMPLE
            Text("Group"),
            SizedBox(height: 5,),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4.0, style: BorderStyle.solid, color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText(
                      'This String will be automatically resized to fit on two lines.',
                      style: TextStyle(fontSize: 20),
                      maxLines: 2,
                      group: textGroup,
                    ),
                    SizedBox(height: 20,),
                    AutoSizeText(
                      'Text 1',
                      style: TextStyle(fontSize: 20),
                      group: textGroup,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            /// RICH TEXT EXAMPLE
            Text("Rich Text"),
            SizedBox(height: 5,),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4.0, style: BorderStyle.solid, color: Colors.redAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: AutoSizeText.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'This String will be '),
                      TextSpan(
                        text: 'automatically ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'resized to fit on two lines.'),
                    ],
                  ),
                  style: TextStyle(fontSize: 20),
                  minFontSize: 5,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

