import 'package:flutter/material.dart';

class Lesson5_1 extends StatefulWidget {
  const Lesson5_1({Key? key}) : super(key: key);

  @override
  _Lesson5_1State createState() => _Lesson5_1State();
}

class _Lesson5_1State extends State<Lesson5_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UI"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.red,fontSize: 35),
            text: "User",
            children: const[
              TextSpan(
                style: TextStyle(color: Colors.green),
                text: " Interface",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MaterialButton _centerButton({text, navigation}) {
  //   return MaterialButton(
  //     color: Colors.greenAccent,
  //     minWidth: 200,
  //     shape: StadiumBorder(),
  //     onPressed: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => navigation));
  //     },
  //     child: Text(text),
  //   );
  // }
}



