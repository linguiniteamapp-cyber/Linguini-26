// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'signup_temp.dart';
import 'login.dart';

class ChooseAccountTypePage extends StatelessWidget {
  const ChooseAccountTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            
            SizedBox(
              width: 70, // مساحة لمس واضحة
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward, // اتجاه صح للشمال
                  color: Color(0xFF1b4a58),
                  size: 35,
                ),
                onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
              ),
            ),
          ],
    ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// Logo
                Image.asset(
                  'images/Linguini00000.png',
                  height: 120,
                ),

                const SizedBox(height: 40),

                const Text(
                  'أنشئ حسابك',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1b4a58),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'اختار كيف تريد الأنضمام الي لينجويني',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                const SizedBox(height: 40),

                /// User Card
                _AccountCard(
                  title: 'حساب مستخدم',
                  subtitle: 'طلب وجبات جاهزة',
                  icon: Icons.person,
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpUserPage(role: 'user',),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 20),

                /// Chef Card
                _AccountCard(
                  title: 'حساب شيف',
                  subtitle: 'بيع وجباتك المنزلية',
                  icon: Icons.restaurant_menu,
                  onTap: () {
                  },
                ),

                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("لديك حساب بالفعل؟",style: 
                    TextStyle(
                      color: Color(0xFF1B4B59),
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    )
                    ),
                     TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Color(0xffF7931E),
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                        fontSize: 14
                    ),
                  ),
                ),
                  ],
                )
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _AccountCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFF2F2F2),
              child: Icon(icon, color: Color(0xFF1B4B59), size: 30),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Almarai',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Almarai',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
