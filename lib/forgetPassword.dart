import 'package:flutter/material.dart';

void main() {
  runApp(ForgotPasswordApp());
}

class ForgotPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordPage(),
    );
  }
}

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(0xFF1b4a58),
                size: 35,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              SizedBox(height: 40),
              // السهم أعلى يمين
            Image.asset(
                    'images/Linguini00000.png',
                    height: 120,
                    width: 300,
                  ),
              // العنوان في المنتصف
                            SizedBox(height: 40),

              Center(
                child: Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 48, 92, 106),
                    fontFamily: 'Almarai'
                  ),
                ),
              ),
              SizedBox(height: 12),

              // الوصف في المنتصف
              Center(
                child: Text(
                  '.أدخل رقم هاتفك، وسنرسل لك رمز تحقق لتعيين كلمة مرور جديدة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 27, 26, 26),fontFamily: 'Almarai'),
                ),
              ),
              SizedBox(height: 24),

              // حقل إدخال رقم الهاتف (نص على اليمين وصغير)
              TextField(
                controller: phoneController,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'رقم الهاتف',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 24),

              // زر إرسال الرمز أصغر ومربع
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'إرسال الرمز',
                    style: TextStyle(fontSize: 14, fontFamily: 'Almarai', color: Color.fromARGB(255, 255, 255, 255), ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E404B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)), // مربع شويه
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}