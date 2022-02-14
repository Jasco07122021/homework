import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:homework/pages/lesson6/lesson6_4_1_login.dart';

class Lesson6_4_1_logout extends StatefulWidget {
  const Lesson6_4_1_logout({Key? key}) : super(key: key);

  @override
  _Lesson6_4_1_logoutState createState() => _Lesson6_4_1_logoutState();
}

class _Lesson6_4_1_logoutState extends State<Lesson6_4_1_logout> {
  TextEditingController nameUser = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  _doSignUp() {
    var box = Hive.box("pdp_online");

    box.put("name", nameUser.text);
    box.put("email", email.text);
    box.put("phone", phone.text);
    box.put("password", password.text);

    if (kDebugMode) {
      print("User name: " + box.get("name"));
      print("Email: " + box.get("email"));
      print("Phone: " + box.get("phone"));
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
                Text(
                  "Create \nAccount",
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 70),
                _textField(
                    text: "User name",
                    controller: nameUser,
                    icon: Icons.person_outline),
                SizedBox(height: 10),
                _textField(
                    text: "E-Mail",
                    controller: email,
                    icon: Icons.mail_outline),
                SizedBox(height: 10),
                _textField(
                    text: "Phone Number",
                    controller: phone,
                    icon: Icons.phone_android),
                SizedBox(height: 10),
                _textField(
                    text: "Password",
                    controller: password,
                    icon: Icons.lock_open),
                SizedBox(height: 50),
                GestureDetector(onTap: _doSignUp, child: _circleButton()),
              ],
            ),

            ///bottom rich text
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                        text: "SIGN IN",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Lesson6_4_1_login()));
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
