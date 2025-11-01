import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // يشيل علامة الديباغ
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF), // خلفية بيضاء
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // النص الأول (Wedly)
              Text(
                "Wedly",
                style: GoogleFonts.greatVibes(
                  fontSize: 74,
                  color: const Color(0xFFC8B560), // ذهبي
                  fontWeight: FontWeight.w400,
                  shadows: [
                    const Shadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // صف فيه النص المتحرك والصورة
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
                          shadows: [
                            const Shadow(
                              blurRadius: 8,
                              color: Colors.black26,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        speed: const Duration(milliseconds: 60),
                      ),
                    ],
                  ),

                  // الصورة بجانب النص
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
