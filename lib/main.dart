import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework/pages/lesson5_10.dart';
import 'package:homework/pages/lesson5_10_home_page.dart';
import 'package:homework/pages/lesson5_9.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Lesson5_10_HomePage(),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.white,
            backgroundColor: Color(0xFF121212),
          ),
          themeMode: currentMode,
          theme: ThemeData(
            primaryColor: Colors.black,
            backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            iconTheme: IconThemeData(color: Colors.grey),
          ),
        );
      },
    );
  }
}
