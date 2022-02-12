import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homework/models/user_model.dart';
import 'package:homework/services/pref_service.dart';

enum LogIn {
  email,
  password,
}
enum LogOut {
  name,
  email,
  phone,
  password,
  confirmPassword,
}

class Lesson6_3 extends StatefulWidget {
  const Lesson6_3({Key? key}) : super(key: key);

  @override
  _Lesson6_3State createState() => _Lesson6_3State();
}

class _Lesson6_3State extends State<Lesson6_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Task1()));
              },
              child: Text("Task 1"),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Task2()));
              },
              child: Text("Task 2"),
            ),
          ],
        ),
      ),
    );
  }
}

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  _Task1State createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool onFocus = false;
  int focusIndex = 2;

  _controllerTextField(LogIn request) {
    switch (request) {
      case LogIn.email:
        return email;
      case LogIn.password:
        return password;
    }
  }

  _doLogin() {
    String emailUser = email.text.trim();
    String passwordUser = password.text.trim();
    User user = User.from(email: emailUser, password: passwordUser);
    Preference.setUser(user);
    Preference.getUser().then((value) => {
          print(value),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            children: [
              Image.asset(
                "assets/images/img_11.png",
                width: 200,
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Log in to your existent account of Q Allure",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 50),
              _textField(
                  prefixIcon: Icons.person_outline,
                  text: "Email",
                  index: 0,
                  controller: LogIn.email),
              SizedBox(height: 20),
              _textField(
                  prefixIcon: Icons.lock_open,
                  text: "Password",
                  index: 1,
                  controller: LogIn.password),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              _loginButton(),
              SizedBox(height: 35),
              Text(
                "Or connect using",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _bottomButtons(
                      text: "Facebook",
                      icon: FontAwesomeIcons.facebookF,
                      color: Color(0xFF3B5998),
                    ),
                    _bottomButtons(
                      text: "Google",
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.grey),
                  children: const [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton _bottomButtons({text, color, icon}) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: color,
      minWidth: 120,
      onPressed: () {},
      textColor: Colors.white,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }

  MaterialButton _loginButton() {
    return MaterialButton(
      shape: StadiumBorder(),
      minWidth: 150,
      padding: EdgeInsets.all(15),
      onPressed: _doLogin,
      child: Text("LOG IN"),
      textColor: Colors.white,
      color: Color(0xFF0000FF),
    );
  }

  Container _textField({text, prefixIcon, index, controller}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.blue.withOpacity(0.2),
            offset: Offset(0, 10),
          )
        ],
      ),
      height: 60,
      child: TextField(
        controller: _controllerTextField(controller),
        onTap: () {
          setState(() {
            onFocus = !onFocus;
            focusIndex = index;
          });
        },
        onSubmitted: (value) {
          setState(() {
            onFocus = !onFocus;
            focusIndex = 2;
          });
        },
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30, right: 15),
            child: Icon(
              prefixIcon,
              size: 22,
              color: focusIndex == index ? Colors.blue : Colors.grey.shade400,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.blue,
          hintStyle: TextStyle(
            color: focusIndex == index ? Colors.blue : Colors.grey.shade400,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
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
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool onFocus = false;
  int focusIndex = 5;

  _controllerTextField(LogOut request) {
    switch (request) {
      case LogOut.name:
        return name;
      case LogOut.email:
        return email;
      case LogOut.phone:
        return phone;
      case LogOut.password:
        return password;
      case LogOut.confirmPassword:
        return confirmPassword;
    }
  }

  _doLogOut() {
    String nameUser = name.text.trim();
    String emailUser = email.text.trim();
    String phoneUser = phone.text.trim();
    String passwordUser = password.text.trim();
    String confirmPasswordUser = confirmPassword.text.trim();
    User user = User(
        name: nameUser,
        email: emailUser,
        phone: int.parse(phoneUser),
        password: passwordUser,
        confirmPassword: confirmPasswordUser);
    Preference.setUser(user);
    Preference.getUser().then((value) => {
          print(value),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                "Let's Get Started!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Create an account to Q Allure to get all features",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              _textField(
                  text: "Name",
                  prefixIcon: Icons.person_outline,
                  index: 0,
                  controller: LogOut.name),
              SizedBox(height: 20),
              _textField(
                  text: "Email",
                  prefixIcon: Icons.email,
                  index: 1,
                  controller: LogOut.email),
              SizedBox(height: 20),
              _textField(
                  text: "Phone",
                  prefixIcon: Icons.phone_android,
                  index: 2,
                  controller: LogOut.phone),
              SizedBox(height: 20),
              _textField(
                  text: "Password",
                  prefixIcon: Icons.lock_open,
                  index: 3,
                  controller: LogOut.password),
              SizedBox(height: 20),
              _textField(
                  text: "Confirm Password",
                  prefixIcon: Icons.lock_open,
                  index: 4,
                  controller: LogOut.confirmPassword),
              SizedBox(height: 30),
              MaterialButton(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: StadiumBorder(),
                onPressed: _doLogOut,
                child: Text(
                  "CREATE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                color: Color(0xFF0000FF),
                textColor: Colors.white,
              ),
              SizedBox(height: 60),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                      color: Colors.grey.shade700, fontWeight: FontWeight.bold),
                  children: const [
                    TextSpan(
                      text: "Login here",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _textField({text, prefixIcon, index, controller}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.blue.withOpacity(0.1),
            offset: Offset(0, 10),
          )
        ],
      ),
      height: 60,
      child: TextField(
        keyboardType: index == 2 ? TextInputType.number : TextInputType.text,
        controller: _controllerTextField(controller),
        onTap: () {
          setState(() {
            onFocus = !onFocus;
            focusIndex = index;
          });
        },
        onSubmitted: (value) {
          setState(() {
            onFocus = !onFocus;
            focusIndex = 5;
          });
        },
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 30, right: 15),
            child: Icon(
              prefixIcon,
              size: 22,
              color: focusIndex == index ? Colors.blue : Colors.grey.shade400,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.blue,
          hintStyle: TextStyle(
            color: focusIndex == index ? Colors.blue : Colors.grey.shade400,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
