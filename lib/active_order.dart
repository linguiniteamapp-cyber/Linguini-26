import 'package:flutter/material.dart';

class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({super.key});

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  static const Color mainColor = Color(0xFF1b4a58);
  static const Color bgColor = Color(0xFFF2F2F2);
  static const Color orangeColor = Color(0xffF7931E);

  bool isReceived = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          backgroundColor: bgColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "تتتبع طلبك",
            style: TextStyle(
              fontFamily: 'Almarai',
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// رقم الطلب
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "رقم الطلب : #216468489",
                  style: const TextStyle(
                    fontFamily: 'Almarai',
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// التايم لاين
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    _buildTimelineItem(
                      Icons.description_outlined,
                      "تم استلام الطلب",
                      "45:2 م",
                      true,
                    ),

                    _buildDivider(),

                    _buildTimelineItem(
                      Icons.inventory_2_outlined,
                      "قيد التحضير",
                      "50:2 م",
                      true,
                    ),

                    _buildDivider(),

                    _buildTimelineItem(
                      Icons.local_shipping_outlined,
                      "قيد التوصيل",
                      "8 - 2025 يونيو",
                      true,
                    ),

                    _buildDivider(),

                    _buildTimelineItem(
                      Icons.check_circle_outline,
                      "تم الاستلام",
                      "8 - 2025 يونيو",
                      isReceived,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// المنتجات
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "المنتجات :",
                  style: const TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              _buildProductCard(),
              const SizedBox(height: 12),
              _buildProductCard(),

              const SizedBox(height: 30),

              /// زر الاستلام
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isReceived = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isReceived ? Colors.green : mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    isReceived ? "تم الاستلام ✔" : "تم الاستلام",
                    style: const TextStyle(
                      fontFamily: 'Almarai',
                      color: Colors.white,
                      fontSize: 16,
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

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildTimelineItem(
      IconData icon, String title, String time, bool done) {
    return Row(
      children: [

        /// الأيقونة
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: done ? orangeColor : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),

        const SizedBox(width: 15),

        /// النص
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  fontFamily: 'Almarai',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          const Icon(Icons.delete_outline,
              color: Colors.orange),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: const [
                Text(
                  "حساب الشيف",
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "برجر وجبة مزدوجة",
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "70\$",
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "images/burger.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}