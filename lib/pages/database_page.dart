// import 'package:flutter/material.dart';
// import 'package:postgres/postgres.dart';
//
// class DatabasePage extends StatefulWidget {
//   const DatabasePage({Key? key}) : super(key: key);
//
//   @override
//   _DatabasePageState createState() => _DatabasePageState();
// }
//
// class _DatabasePageState extends State<DatabasePage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//   String? email;
//   String? password;
//
//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(() {
//       setState(() {});
//     });
//     passwordController.addListener(() {
//       setState(() {});
//     });
//   }
//
//   _addDataBase(context) async {
//     if (password == null ||
//         email == null ||
//         password!.isEmpty ||
//         email!.isEmpty) {
//       print("Not data");
//     } else {
//       var connection = PostgreSQLConnection("10.0.2.2", 5432, "instagram",
//           username: "postgres", password: "Apple2020");
//       await connection.open();
//       await connection.query('''
//     INSERT INTO insta_user (name,email,password)
//     VALUES ('Jermaine Oppong','$email','$password')
//   ''');
//       List<List<dynamic>> results = await connection
//           .query("SELECT id,name,email,password FROM insta_user");
//
//       for (var x in results) {
//         if (x.contains("Bekzodjon")) {
//           print(x);
//         }
//       }
//       await connection.close();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.only(left: 40, right: 40, top: 120),
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               Text(
//                 "Sign Up",
//                 style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 50,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 120,
//               ),
//               _textFieldEmail(),
//               SizedBox(
//                 height: 10,
//               ),
//               _passwordFieldEmail(),
//               SizedBox(
//                 height: 200,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               MaterialButton(
//                 minWidth: 200,
//                 height: 50,
//                 shape: StadiumBorder(),
//                 color: Colors.blue,
//                 onPressed: () => _addDataBase(context),
//                 child: Text(
//                   "Sign up",
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _textFieldEmail() {
//     return TextField(
//       onChanged: (value) => setState(() => email = value),
//       onSubmitted: (value) => setState(() => email = value),
//       controller: emailController,
//       decoration: InputDecoration(
//           hintText: "Email",
//           label: Text("Email"),
//           labelStyle: TextStyle(fontWeight: FontWeight.bold),
//           hintStyle:
//               TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//           suffixIcon: emailController.text.isEmpty
//               ? SizedBox.shrink()
//               : IconButton(
//                   onPressed: () {
//                     emailController.clear();
//                   },
//                   icon: Icon(Icons.close))),
//     );
//   }
//
//   Widget _passwordFieldEmail() {
//     return TextField(
//       controller: passwordController,
//       maxLength: 8,
//       onChanged: (value) => setState(() => password = value),
//       onSubmitted: (value) => setState(() => password = value),
//       decoration: InputDecoration(
//         // errorText: passwordController.text.length == 8  ? :"Please you must write a maximum of 8 letters !",
//         labelStyle: TextStyle(fontWeight: FontWeight.bold),
//         hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         hintText: "Password",
//         label: Text("Password"),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
//         suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {});
//               isPasswordVisible = !isPasswordVisible;
//             },
//             icon: passwordController.text.isEmpty
//                 ? Icon(Icons.security)
//                 : Icon(Icons.remove_red_eye)),
//       ),
//       obscureText: isPasswordVisible,
//     );
//   }
// }
