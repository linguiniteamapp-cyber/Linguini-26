import 'package:flutter/material.dart';
import 'package:linguini_app/login.dart';
import 'package:linguini_app/welcome/wepage3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding2Page(),
    );
  }
}

class Onboarding2Page extends StatelessWidget {
  const Onboarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                const SizedBox(height: 70),

                /// الأيقونة
                Container(
                  child: Image.asset(
                    'images/p2.png',
                    fit: BoxFit.contain,
                    width: 280,

                  ),
                ),

                const SizedBox(height: 40),

                /// النقاط
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomDot(active: false),
                    SizedBox(width: 6),
                    CustomDot(active: true),
                    SizedBox(width: 6),
                    CustomDot(active: false),
                  ],
                ),

                const SizedBox(height: 35),

                /// العنوان
                const Text(
                  'اختار ما تحب، ودعنا نهتم بالباقي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai',
                    color: Color(0xFF1B4A58),
                  ),
                ),

                const SizedBox(height: 12),

                /// الوصف
                const Text(
                  'تصفّح الشيفات، انتقي طبقك المفضل وسيصلك محضّرًا خصيصًا لك.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Almarai',
                    color: Colors.black54,
                  ),
                ),

                const Spacer(),

                /// الأزرار
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// زر التالي (يمين)
                    SizedBox(
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Onboarding3Page(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B4A58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'التالي',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    /// زر تخطي (شمال)
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'تخطي',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1B4A58),
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// شكل النقاط
class CustomDot extends StatelessWidget {
  final bool active;

  const CustomDot({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1B4A58) : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF1B4A58),
          width: 1.5,
        ),
      ),
    );
  }
}