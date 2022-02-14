import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework/pages/lesson6/lesson6_4_1_logout.dart';

class Lesson6_4_1_login extends StatefulWidget {
  const Lesson6_4_1_login({Key? key}) : super(key: key);

  @override
  _Lesson6_4_1_loginState createState() => _Lesson6_4_1_loginState();
}

class _Lesson6_4_1_loginState extends State<Lesson6_4_1_login> {
  TextEditingController nameUser = TextEditingController();
  TextEditingController password = TextEditingController();

  _doSignIn() {
    var box = Hive.box("pdp_online");
    box.put("name", nameUser.text);
    box.put("password", password.text);

    if (kDebugMode) {
      print("User name: " + box.get("name"));
      print("Password: " + box.get("password"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.withOpacity(0.3),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ///body
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/user_2.jpeg",
                    height: 60,
                  ),
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Sign in to continue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                _textField(
                  text: "User name",
                  controller: nameUser,
                  icon: Icons.person_outlined,
                ),
                SizedBox(height: 10),
                _textField(
                  text: "Password",
                  controller: password,
                  icon: Icons.lock_open,
                ),
                SizedBox(height: 25),
                Text(
                  "Forget password?",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 40),
                GestureDetector(onTap: _doSignIn, child: _circleButton()),
              ],
            ),

            ///bottom rich text
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: "SIGN UP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Lesson6_4_1_logout()));
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _circleButton() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.lightBlueAccent,
            Colors.lightBlueAccent.withOpacity(0.7),
            Colors.lightBlueAccent.withOpacity(0.5),
            Colors.blue.withOpacity(0.5),
          ],
        ),
      ),
      child: Icon(
        CupertinoIcons.arrow_right,
        size: 30,
      ),
    );
  }

  TextField _textField({text, controller, icon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15),
        hintText: text,
        hintStyle: TextStyle(fontSize: 15),
        prefixIcon: Icon(
          icon,
          size: 20,
        ),
      ),
    );
  }
}
