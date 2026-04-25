// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linguini_app/choose_account.dart';
import 'package:linguini_app/login.dart';
import 'package:linguini_app/otp_page.dart';
import 'package:linguini_app/otp_temp.dart';
import 'package:linguini_app/profile_setup_1.dart';
import 'package:firebase_core/firebase_core.dart';
class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({super.key, required this.role});
    final String role; // User أو Chef

  @override
  State<SignUpUserPage> createState() => _SignUpUserPageState();
}
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
class _SignUpUserPageState extends State<SignUpUserPage> {
  bool acceptTerms = false;
  bool isObscure = true;

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
                        builder: (context) => const ChooseAccountTypePage(),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'images/Linguini00000.png',
                    height: 110,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'إنشاء حساب',
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1b4a58),
                    ),
                  ),

                  const SizedBox(height: 32),

                  _buildField('الاسم كامل', controller: nameController),
                  _buildField('رقم الهاتف', controller: phoneController),
                  _buildField('البريد الإلكتروني', controller: emailController),
                  _buildField(
                    'كلمة المرور',
                    obscure: isObscure,
                    controller: passwordController,
                    suffix: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 0),

                  /// Terms
                  Row(
                    children: [
                      Checkbox(
                        value: acceptTerms,
                        activeColor: const Color(0xFF1b4a58),
                        onChanged: (v) {
                          setState(() {
                            acceptTerms = v!;
                          });
                        },
                      ),
                      TextButton(
                    onPressed: () {
                      // TODO: Forgot password
                      Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChooseAccountTypePage(),
                            ),
                          );
                    },
                        child: Text(
                          'أوافق على الشروط والأحكام',
                          style: TextStyle(
                            fontFamily: 'Almarai',
                            color: Color(0xffF7931E),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xffF7931E),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: acceptTerms ? () async {
                        try {
                          // 1️⃣ إنشاء الحساب في Firebase
                          UserCredential userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              );

                          // 2️⃣ إرسال رابط تفعيل البريد
                          await userCredential.user!.sendEmailVerification();

                          // 3️⃣ الانتقال لصفحة تأكيد البريد
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VerifyEmailPage(
                                user: userCredential.user!,
                                role: widget.role,
                              ),
                            ),
                          );

                        } catch (e) {
                          // إظهار رسالة خطأ
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1b4a58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  
                const SizedBox(height: 6),

                  InkWell(
                  onTap: () {
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.all(4),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        'images/Google_Favicon_2025.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Almarai',
                        fontSize: 16,
                      ),
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
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _buildField(String label, {bool obscure = false, Widget? suffix, TextEditingController? controller}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontFamily: 'Almarai'),
          suffixIcon: suffix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),

      /// 🔥 Border عند الوقوف على الحقل
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(
          color: Color(0xffF7931E), // الأصفر
          width: 2,
        ),
      ),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
          ),
        ),
      ),
    );
  }
}
