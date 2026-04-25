import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),

        /// ================= Bottom Bar =================
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
            color: Color(0xFF1b4a58),
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.delivery_dining, color: Colors.white),
              Icon(Icons.shopping_cart_outlined, color: Colors.white),
              Icon(Icons.home, color: Color(0xffF7931E), size: 30),
              Icon(Icons.restaurant_menu, color: Colors.white),
              Icon(Icons.person_outline, color: Colors.white),
            ],
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ================= Header =================
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1b4a58),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(26),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Top Row
                      Row(
                        children: [
                          Image.asset(
                            'images/Linguini00000.png',
                            height: 34,
                          ),
                          const Spacer(),
                          const Text(
                            'مرحبًا\nبي',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Almarai',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// Search
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: 'ابحث',
                                  prefixIcon: Icon(Icons.search),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.tune),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// ================= Address =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, size: 18),
                      SizedBox(width: 6),
                      Text(
                        'مصر - المنصورة - توريل',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// ================= Offer =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF7931E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'اطلب الآن',
                            style: TextStyle(
                              fontFamily: 'Almarai',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// ================= Categories =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (_) {
                      return Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
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

                const SizedBox(height: 20),

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
                          fontSize: 17,
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

                const SizedBox(height: 12),

                /// ================= Products =================
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 95,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'وجبة مميزة',
                                style: TextStyle(
                                  fontFamily: 'Almarai',
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '50 ج',
                                style: TextStyle(
                                  color: Color(0xffF7931E),
                                  fontFamily: 'Almarai',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
