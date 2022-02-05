import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework/animations/animations.dart';

class Lesson5_7 extends StatefulWidget {
  const Lesson5_7({Key? key}) : super(key: key);

  @override
  _Lesson5_7State createState() => _Lesson5_7State();
}

class _Lesson5_7State extends State<Lesson5_7> {
  Color color = Colors.transparent;

  _changeColor() {
    Timer(Duration(seconds: 1), () {
      setState(() {
        color = Colors.black45;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _changeColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          ///Task 1
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img_18.png"),
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              color: color,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Animations(
                      delay: 3,
                      child: Text(
                        "Find the best\nparties near you.",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Animations(
                      delay: 4,
                      child: Text(
                        "Let us find you a tutorial for your interest",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Animations(
                      delay: 5,
                      child: MaterialButton(
                        minWidth: double.infinity,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(15),
                        onPressed: () {},
                        child: Text(
                          "Start",
                          style: TextStyle(fontSize: 18),
                        ),
                        color: Colors.orange.withOpacity(0.9),
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            ),
          ),

          ///Task 2
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img_18.png"),
              ),
            ),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              color: color,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Animations(
                      delay: 3,
                      child:

                          ///text => 1
                          Text(
                        "Find the best\nparties near you.",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    ///text => 2
                    Animations(
                      delay: 4,
                      child: Text(
                        "Let us find you a tutorial for your interest",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),

                    ///Bottom buttons 2x
                    Animations(
                      delay: 5,
                      child: Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(15),
                              onPressed: () {},
                              child: Text(
                                "Google",
                                style: TextStyle(fontSize: 18),
                              ),
                              color: Colors.red,
                              textColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: MaterialButton(
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(15),
                              onPressed: () {},
                              child: Text(
                                "Facebook",
                                style: TextStyle(fontSize: 18),
                              ),
                              color: Colors.blue,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
