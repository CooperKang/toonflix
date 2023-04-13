import 'package:flutter/material.dart';
import 'package:ramgtoon/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: const Color(0xFFD55846)),
            textTheme: const TextTheme(
              displayLarge: TextStyle(color: Color(0xFFD55846)),
            ),
            cardColor: const Color(0xFFFFFFFF)),
        home: const HomeScreen());
  }
}
