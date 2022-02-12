import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework/pages/lesson6/lesson6_3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('fr', 'FR'),
        Locale('ja', 'JA'),
        Locale('ko', 'KO'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en','US'),
      child: const MyApp(),
    ),
  );
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
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: Lesson6_3(),
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
