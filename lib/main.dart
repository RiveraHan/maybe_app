import 'package:flutter/material.dart';
import 'package:maybe_app/config/theme/app_theme.dart';
import 'package:maybe_app/presentation/screens/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Maybe App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectColor: 3).theme(),
        home: const ChatScreen());
  }
}
