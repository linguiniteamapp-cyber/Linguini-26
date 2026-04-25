import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required User user, required String role});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get otpCode =>
      _controllers.map((e) => e.text).join();

  void _verifyOtp() {
    if (otpCode.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك أدخل رمز التحقق كامل')),
      );
      return;
    }

    debugPrint('OTP Code: $otpCode');
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
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                /// Logo0
                Image.asset(
                  'images/Linguini00000.png',
                  height: 120,
                  width: 300,
                ),

                const SizedBox(height: 40),

                /// Title
                const Text(
                  'أدخل رمز التحقق',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Almarai',
                    color: Color(0xFF1b4a58)
                  ),
                ),

                const SizedBox(height: 8),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text(
                    'تم إرسال رمز التحقق إلى رقم هاتفك',
                    style: TextStyle(
                      color: Color.fromARGB(255, 39, 39, 39),                    
                      fontSize: 16,
                    ),
                    
                  ),
                ),

                const SizedBox(height: 32),

                /// OTP Fields
                Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return SizedBox(
          
          width: 60,
          height: 60,
          child: TextField(
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
              height: 1.5,
            ),
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  
                  color: Color(0xfff79a33),
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    ),
    const SizedBox(height: 20), // مسافة بين الصفين
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return SizedBox(
          width: 60,
          height: 60,
          child: TextField(
            controller: _controllers[index + 3], // مهم جداً
            focusNode: _focusNodes[index + 3],   // مهم جداً
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xfff79a33),
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) => _onChanged(value, index + 3),
          ),
        );
      }),
    ),
  ],
),


                const SizedBox(height: 40),

                /// Verify Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1b4a58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'تحقق',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Almarai',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                                /// Resend
                Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("لم يصلك الرمز؟" ,style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontFamily: 'inter',
                    ),),
                    TextButton(
                  onPressed: () {
                 
                  },
                  
                  child:
                  const Text(
                    'إعادة إرسال الرمز',
                    style: TextStyle(
                      color: Color(0xffF7931E),
                      fontFamily: 'inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
