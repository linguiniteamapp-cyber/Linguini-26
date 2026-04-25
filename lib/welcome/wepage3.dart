import 'package:flutter/material.dart';
import 'package:linguini_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding3Page(),
    );
  }
}

class Onboarding3Page extends StatelessWidget {
  const Onboarding3Page({super.key});

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

                /// صورة اللوجو
                Image.asset(
                  'images/p3.png', // غيرها باسم صورتك
                  width: 260,
                ),

                const SizedBox(height: 35),

                /// النقاط
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomDot(active: true),
                    SizedBox(width: 6),
                    CustomDot(active: false),
                    SizedBox(width: 6),
                    CustomDot(active: false),
                  ],
                ),

                const SizedBox(height: 35),

                /// العنوان
                const Text(
                  'ثقة في الاختيار... وسهولة في التجربة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai',
                    color: Color(0xFF1B4A58),
                  ),
                ),

                const SizedBox(height: 30),

                /// المميزات
                const FeatureItem(
                  icon: Icons.verified_user_outlined,
                  text: 'شيفات محترفة منهم',
                ),
                const SizedBox(height: 15),

                const FeatureItem(
                  icon: Icons.local_offer_outlined,
                  text: 'أسعار واضحة',
                ),
                const SizedBox(height: 15),

                const FeatureItem(
                  icon: Icons.delivery_dining_outlined,
                  text: 'وتجربة طلب سلسة',
                ),

                const Spacer(),

                /// الأزرار
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// زر ابدأ الآن
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
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
                          'ابدأ الآن',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    /// زر تخطي
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

/// عنصر المميزات
class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: const Color(0xFF1B4A58),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Almarai',
            color: Colors.black87,
          ),
        ),
      ],
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
