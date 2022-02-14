import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homework/models/lesson6_4_model.dart';
import 'package:homework/services/hive_les6_4_2.dart';

class Lesson6_4_2_SignUpPage extends StatefulWidget {
  const Lesson6_4_2_SignUpPage({Key? key}) : super(key: key);

  @override
  _Lesson6_4_2_SignUpPageState createState() => _Lesson6_4_2_SignUpPageState();
}

class _Lesson6_4_2_SignUpPageState extends State<Lesson6_4_2_SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController address = TextEditingController();

  _doSignUp() {
    UserLesson6H4 user = UserLesson6H4(
        email: email.text, number: number.text, address: address.text);
    HiveDB.setData(user);
    String result = HiveDB.getData();
    if (kDebugMode) {
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///header
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///body
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 50),
                      _textTopOfTextField(text: "Email"),
                      SizedBox(height: 10),
                      _textField(text: "Email", controller: email),
                      SizedBox(height: 30),
                      _textTopOfTextField(text: "Number"),
                      SizedBox(height: 10),
                      _textField(text: "Number", controller: number),
                      SizedBox(height: 30),
                      _textTopOfTextField(text: "Address"),
                      SizedBox(height: 10),
                      _textField(text: "Address", controller: address),
                      SizedBox(height: 30),

                      ///sign up button
                      MaterialButton(
                        onPressed: _doSignUp,
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18),
                        ),
                        textColor: Colors.white,
                        color: Colors.teal,
                        minWidth: double.infinity,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 30),

                      ///or text
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 40),

                      ///company icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _companyIcons(
                              icon: FontAwesomeIcons.facebookF,
                              color: Color(0xFF0000FF)),
                          _companyIcons(
                              icon: FontAwesomeIcons.twitter,
                              color: Colors.blue),
                          _companyIcons(
                              icon: FontAwesomeIcons.instagram,
                              color: Colors.black),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Icon _companyIcons({icon, color}) {
    return Icon(
      icon,
      color: color,
      size: 16,
    );
  }

  Align _textTopOfTextField({text}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  TextField _textField({text, controller}) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 0.1),
        ),
      ),
    );
  }
}
