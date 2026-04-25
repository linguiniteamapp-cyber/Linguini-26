import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linguini_app/choose_account.dart';
import 'package:linguini_app/profile_setup_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:linguini_app/models/user_model.dart';

class CompleteProfilePage extends StatefulWidget {
  const CompleteProfilePage({super.key, required this.user, required this.role});

  final User user;
  final String role;

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  String gender = 'ذكر';

  bool _isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

void _submitForm() async {
  if (!_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('من فضلك أكمل جميع البيانات بشكل صحيح', textDirection: TextDirection.rtl),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  if (birthController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('من فضلك اختر تاريخ الميلاد', textDirection: TextDirection.rtl),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  // حفظ البيانات في Firestore
  await FirebaseFirestore.instance.collection('users').doc(widget.user.uid).set({
    'fullName': nameController.text.trim(),
    'email': emailController.text.trim(),
    'birthDate': birthController.text.trim(),
    'gender': gender,
    'role': widget.role,
    'createdAt': Timestamp.now(),
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('تم حفظ البيانات بنجاح', textDirection: TextDirection.rtl),
      backgroundColor: Colors.green,
    ),
  );

  UserModel userModel = UserModel(
    uid: widget.user.uid,
    email: emailController.text.trim(),
    fullName: nameController.text.trim(),
    birthDate: birthController.text.trim(),
    gender: gender,
    role: widget.role, name: '', phone: '', governorate: '', city: '', street: '', building: '', apartment: '', landmark: '',
  );

  Future.delayed(const Duration(seconds: 1), () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AddressScreen(user: userModel, role: widget.role),
      ),
    );
  });
}

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Image.asset(
                    'images/Linguini00000.png',
                    height: 130,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'أكمل ملفك الشخصي',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1b4a58),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'لنبدأ التعرف عليك بشكل أفضل',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Almarai',
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'الخطوة 1 ',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Color(0xffF7931E),
                        ),
                      ),
                      Text(
                        'من 2',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  _buildField(
                    controller: nameController,
                    label: 'الاسم الكامل',
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildField(
                    controller: emailController,
                    label: 'الإيميل',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '';
                      }
                      if (!_isValidEmail(value)) {
                        return '';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  _buildField(
                    controller: birthController,
                    label: 'تاريخ الميلاد',
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        birthController.text =
                            '${date.year}-${date.month}-${date.day}';
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const Text(
                        'النوع:',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Color(0xFF1b4a58),
                        ),
                      ),
                      const SizedBox(width: 20),
                      _genderRadio('ذكر'),
                      const SizedBox(width: 20),
                      _genderRadio('أنثى'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1b4a58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'استمرار',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'تخطي الآن',
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        color: Color(0xffF7931E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontFamily: 'Almarai',
            color: Color(0xFF1b4a58),
          ),
          errorStyle: const TextStyle(height: 0),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xffF7931E),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _genderRadio(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: gender,
          activeColor: const Color(0xffF7931E),
          onChanged: (val) {
            setState(() => gender = val!);
          },
        ),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Almarai',
          ),
        ),
      ],
    );
  }
}
