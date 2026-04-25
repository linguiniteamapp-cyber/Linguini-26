import 'package:flutter/material.dart';
import 'package:linguini_app/active_order.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActiveOrdersScreen(),
    );
  }
}

class ActiveOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/commercial.png'), 
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              const Text(
                'لا توجد طلبات نشطة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1D4D5C),
                  fontFamily: 'Almarai'
                ),
              ),
              const SizedBox(height: 15),
              
              const Text(
                'يبدو أنه ليس لديك أي طلبات في الوقت الحالي.\nتصفح الأطباق واختر طبقك المفضل لبدء تجربة جديدة.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFF555555),
                  fontFamily: 'Almarai'
                ),
              ),
              const SizedBox(height: 50),
              
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderTrackingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9A33D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'إستكشاف الأطباق',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Almarai'
                    ),
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