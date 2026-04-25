import 'package:flutter/material.dart';
import 'product_card.dart';
import 'custom_bottom_bar.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ================= Header =================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF1b4a58),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [

                  /// Logo + Welcome
                  Row(
                    children: [
                      Image.asset(
                        'images/Linguini00000.png',
                        height: 28,
                      ),
                      const Spacer(),
                      const Text(
                        'مرحبًا 👋',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Almarai',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  /// Search
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 10),
                        Icon(Icons.tune),
                        SizedBox(width: 6),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ابحث',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            /// ================= Location =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.location_on_outlined, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'مصر - المنصورة - توريل',
                    style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// ================= Banner =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF7931E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'اطلب الآن',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// ================= Categories =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'وجبات',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            const SizedBox(height: 24),

            /// ================= Products Title =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'منتجات مميزة',
                    style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'المزيد',
                    style: TextStyle(
                      color: Color(0xffF7931E),
                      fontFamily: 'Almarai',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// ================= Products List =================
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(right: 16),
                children: const [
                  ProductCard(isSelected: true),
                  SizedBox(width: 12),
                  ProductCard(),
                  SizedBox(width: 12),
                  ProductCard(),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
