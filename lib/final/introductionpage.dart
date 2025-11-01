import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_page.dart'; // تأكد أن المسار صحيح

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      // عرض مؤشر التحميل
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFC8B560),
          ),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));

      // إغلاق مؤشر التحميل
      Navigator.pop(context);

      // الانتقال لصفحة تسجيل الدخول
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wedly",
                style: GoogleFonts.greatVibes(
                  fontSize: 74,
                  color: const Color(0xFFC8B560),
                  fontWeight: FontWeight.w400,
                  shadows: const [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedTextKit(
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        "Celebrate without limits ",
                        textStyle: GoogleFonts.greatVibes(
                          fontSize: 25,
                          color: const Color(0xFFC8B560),
                          fontWeight: FontWeight.w400,
                          shadows: const [
                            Shadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        speed: const Duration(milliseconds: 55),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'emojis/Ring-Emojis.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
