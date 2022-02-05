import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class Lesson6_1 extends StatefulWidget {
  const Lesson6_1({Key? key}) : super(key: key);

  @override
  _Lesson6_1State createState() => _Lesson6_1State();
}

class _Lesson6_1State extends State<Lesson6_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _centerButton(navigation: Task1(), text: "Task 1"),
            _centerButton(navigation: Task2(), text: "Task 2")
          ],
        ),
      ),
    );
  }

  MaterialButton _centerButton({navigation, text}) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
      },
      child: Text(text),
      color: Colors.green,
      textColor: Colors.white,
    );
  }
}

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  _Task1State createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Text('welcome').tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Row(
              children: [
                _bottomButtons(color: Colors.green,text: "English"),
                SizedBox(width: 10),
                _bottomButtons(color: Colors.red,text: "Russian"),
                SizedBox(width: 10),
                _bottomButtons(color: Colors.blue,text: "Uzbek"),
                SizedBox(width: 10),
                _bottomButtons(color: Colors.orange,text: "French"),
              ],
            ),
          )
        ],
      ),
    );
  }
  Expanded _bottomButtons({color, text}) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          if(text == "English") context.setLocale(Locale('en','US'));
          if(text == "Russian") context.setLocale(Locale('ru','RU'));
          if(text == "Uzbek") context.setLocale(Locale('uz','UZ'));
          if(text == "French") context.setLocale(Locale('fr','FR'));
        },
        child: Text(text),
        textColor: Colors.white,
      ),
    );
  }

}

class Task2 extends StatefulWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  _Task2State createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Text('welcome').tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Row(
              children: [
                _bottomButtons(color: Colors.green,text: "English"),
                SizedBox(width: 10),
                _bottomButtons(color: Colors.red,text: "Korean"),
                SizedBox(width: 10),
                _bottomButtons(color: Colors.blue,text: "Japanese"),
              ],
            ),
          )
        ],
      ),
    );
  }
  Expanded _bottomButtons({color, text}) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          if(text == "English") context.setLocale(Locale('en','US'));
          if(text == "Korean") context.setLocale(Locale('ja','JA'));
          if(text == "Japanese") context.setLocale(Locale('ko','KO'));
        },
        child: Text(text),
        textColor: Colors.white,
      ),
    );
  }
}


