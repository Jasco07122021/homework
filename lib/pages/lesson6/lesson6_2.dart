// import 'package:flutter/material.dart';
// import 'package:get_version/get_version.dart';
//
// class Lesson6_2 extends StatefulWidget {
//   const Lesson6_2({Key? key}) : super(key: key);
//
//   @override
//   _Lesson6_2State createState() => _Lesson6_2State();
// }
//
// class _Lesson6_2State extends State<Lesson6_2> {
//   String _platformVersion = '';
//   String _projectVersion = '';
//   String _projectAppID = '';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initPlatformState();
//   }
//
//   initPlatformState() async {
//     _platformVersion = await GetVersion.platformVersion;
//     _projectVersion = await GetVersion.platformVersion;
//     _projectAppID = await GetVersion.appID;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_platformVersion),
//             Text(_projectVersion),
//             Text(_projectAppID),
//           ],
//         ),
//       ),
//     );
//   }
// }
