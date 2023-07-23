import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'แค่เทอส่งยิ้มมา ใจฉันก็แทบละลาย🤪🤪🤪',
    'ถึงเราจะไม่สูง แต่เราจูงมือเธอได้นะ 💕',
    'อกหัก คือ ประสบการณ์😎 ขึ้นคาน คือ ชะตากรรม🙄🤔',
    'ถึงเซเว่นจะไม่ใส่ถุง แต่เราใส่ใจนะ ^ ^',
    'ไม่ได้อยู่ในวงสนทนา ก็ถูกนินทาเป็นเรื่องปกติ',
    'อยู่ดีดีก็โสด แต่อยู่โสดโสดก็ดี',
    'ไม่ได้เจ้าชู้ แต่เนื้อคู่มันเยอะ',
  ];
  static const List<Color> colorList = [
    Colors.green,
    Colors.yellow,
    Colors.deepOrangeAccent,
    Colors.red,
    Colors.pink,
    Colors.greenAccent,
    Colors.lightBlueAccent
  ];
  var _quote = quoteList[0];
  var color = colorList[0];
  var quoteBefore = 0;

  void _handleClickGo() {
    var rand =   Random();
    var ran = rand.nextInt(quoteList.length);
    setState(() {

      if (quoteBefore != ran) {
        quoteBefore = ran;
        _quote = quoteList[quoteBefore];
      } else {
        for (int i = 0;; i++) {
          ran = rand.nextInt(quoteList.length);
          if (quoteBefore != ran) {
            quoteBefore = ran;
            _quote = quoteList[quoteBefore];
            break;
          }
        }
      }
      var randomColor = rand.nextInt(colorList.length);
      color = colorList[randomColor];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำคม/แคปชั่นกวนๆ'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleClickGo,
        child: const Text('สุ่ม',textAlign: TextAlign.center,),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Text(
              _quote,
              style: TextStyle(
                color: color,
                fontSize: 80,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
