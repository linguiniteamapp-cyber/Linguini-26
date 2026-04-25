import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_setup_1.dart'; // صفحتك لتكملة البيانات

class VerifyEmailPage extends StatelessWidget {
  final User user;
  final String role;

  const VerifyEmailPage({super.key, required this.user, required this.role});

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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Linguini00000.png', height: 120),
                const SizedBox(height: 40),
                const Text(
                  'تأكيد البريد الإلكتروني',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Almarai',
                    color: Color(0xFF1b4a58),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'تم إرسال رابط التفعيل إلى بريدك الإلكتروني. افتح البريد واضغط على الرابط لتأكيد الحساب.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child:
                  ElevatedButton(
                    onPressed: () async {
                      await user.reload();  // 🔹 تحديث حالة المستخدم
                      var updatedUser = FirebaseAuth.instance.currentUser; // 🔹 خذ الكائن المحدث
                      if(updatedUser!.emailVerified){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CompleteProfilePage(user: updatedUser, role: role),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('الرجاء تأكيد البريد أولاً')),
                        );
                      }
                    },
                    child: const Text('تم التفعيل'),
                  )
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () async {
                    await user.sendEmailVerification();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم إرسال الرابط مرة أخرى')),
                    );
                  },
                  child: const Text(
                    'إعادة إرسال رابط التفعيل',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF7931E),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}