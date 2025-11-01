import 'package:flutter/material.dart';
import 'final/introductionpage.dart'; // تأكد من مسار intro_page.dart صحيح

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(), // الصفحة الرئيسية تبدأ من الانترو
    );
  }
}
