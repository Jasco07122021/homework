import 'package:flutter/material.dart';

class Lesson5_2 extends StatefulWidget {
  const Lesson5_2({Key? key}) : super(key: key);

  @override
  _Lesson5_2State createState() => _Lesson5_2State();
}

class _Lesson5_2State extends State<Lesson5_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade900,
              Colors.grey.shade500,
              Colors.grey.shade500
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 100),

            ///Sign Up + Welcome text
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 80, left: 25, right: 25),
                    child: Column(
                      children: [
                        ///TextFields
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(171, 171, 171, 0.7),
                                blurRadius: 10,
                                offset: Offset(0.5, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ///Full name
                              _textField(text: "Full name"),

                              ///Email
                              _textField(text: "Email"),

                              ///Phone
                              _textField(text: "Phone"),

                              ///Password
                              _textField(text: "Password"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),

                        ///Sign Up button
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 20),
                          shape: const StadiumBorder(),
                          color: Colors.grey.shade700,
                          onPressed: () {},
                          child: const Text(
                            "SignUp",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30),

                        ///Sign Up with SNS
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up with SNS",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 20),

                        ///Bottom Buttons 3 x
                        Row(
                          children: [
                            _bottomButtons3x(
                                text: "Facebook", color: Colors.blue),
                            SizedBox(width: 10),
                            _bottomButtons3x(text: "Google", color: Colors.red),
                            SizedBox(width: 10),
                            _bottomButtons3x(
                                text: "Apple", color: Colors.black),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _bottomButtons3x({text, color}) {
    return Expanded(
      child: MaterialButton(
        padding:
            const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        color: color,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        shape: StadiumBorder(),
      ),
    );
  }

  TextField _textField({text}) {
    return TextField(
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        hintText: text,
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
