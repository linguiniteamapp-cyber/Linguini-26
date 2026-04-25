import 'package:flutter/material.dart';
import 'package:linguini_app/pay.dart';
import 'package:linguini_app/home/home_root_page.dart';

class CartItem {
  String title;
  String subtitle;
  String image;
  double price;
  int qty;

  CartItem({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.price,
    this.qty = 1,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  static const primary = Color(0xFF123D4A);
  static const accent = Color(0xFFF7931E);
  static const bg = Color(0xFFF5F5F5);
  final TextEditingController couponController = TextEditingController();

  double shipping = 20;
  double servicePercent = 5;

  double discount = 0;
  bool couponApplied = false;
  void applyCoupon() {
  if (couponController.text.trim() == "SAVE10") {
    setState(() {
      discount = subtotal * 0.10;
      couponApplied = true;
    });
  } else {
    setState(() {
      discount = 0;
      couponApplied = false;
    });
  }
}
double get total =>
    subtotal + shipping + (subtotal * servicePercent / 100) - discount;

  List<CartItem> items = [
    CartItem(
        title: "حساب الشيف",
        subtitle: "تجهيز وجبات منزلية",
        image: "images/burger.png",
        price: 70,
        qty: 6),
    CartItem(
        title: "حساب الشيف",
        subtitle: "تجهيز وجبات منزلية",
        image: "images/pasta.png",
        price: 70,
        qty: 6),
    CartItem(
        title: "حساب الشيف",
        subtitle: "تجهيز وجبات منزلية",
        image: "images/steak.png",
        price: 70,
        qty: 6),
  ];

  void removeItem(int index) {
    setState(() => items.removeAt(index));
  }

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.price * item.qty);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        
        body:
          SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Text("السلة",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primary)),
              const SizedBox(height: 16),
              Expanded(
              child: items.isEmpty
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                            Image.asset("images/empty_cart.png", height: 240), // حط صورتك هنا
                            const SizedBox(height: 2),
                            const Text("السلة فارغة",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      fontSize: 18,
                      color: Color(0xFF1D4D5C),
                      fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            const Text("أضف  للمتابعة",
                  style: TextStyle(color: Colors.grey,fontSize: 20,fontFamily: "Almarai")),
                                const SizedBox(height: 16),
                  SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeRootPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D4D5C),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'اضف الي سلتك',
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
              )
      : ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, i) => CartItemCard(
            item: items[i],
            onDelete: () => removeItem(i),
            onQtyChanged: () => setState(() {}),
          ),
        ),
),

if (items.isNotEmpty)
  OrderSummary(
    subtotal: subtotal,
    shipping: shipping,
    percent: servicePercent,
    total: total,
    discount: discount,
    controller: couponController,
    onApply: applyCoupon,
  )

            ],
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatefulWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onQtyChanged;

  const CartItemCard(
      {super.key,
      required this.item,
      required this.onDelete,
      required this.onQtyChanged});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool pressed = false;

@override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: pressed ? const Color(0xFFF0F0F0) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Row(
          textDirection: TextDirection.ltr,

        children: [
          GestureDetector(
            onTap: widget.onDelete,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.delete_outline, color: Color(0xFFF7931E)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // 🔗 حطي هنا صفحة الشيف
                  },
                  child: const Text("حساب الشيف",
                      style: TextStyle(
                          fontFamily: "Almarai",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF1E2A2F))),
                ),
                const SizedBox(height: 4),
                const Text("تجهيز وجبات منزلية",
                    style: TextStyle(
                        fontFamily: "Almarai",
                        fontSize: 13,
                        color: Color(0xFF6B7C85))),
                const SizedBox(height: 6),
                Text("${widget.item.price}\$",
                    style: const TextStyle(
                        fontFamily: "Almarai",
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF123D4A))),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _qtyBtn(Icons.remove, () {
                      if (widget.item.qty > 1) {
                        setState(() => widget.item.qty--);
                        widget.onQtyChanged();
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("${widget.item.qty}",
                          style: const TextStyle(
                              fontFamily: "Almarai",
                              fontWeight: FontWeight.bold)),
                    ),
                    _qtyBtn(Icons.add, () {
                      setState(() => widget.item.qty++);
                      widget.onQtyChanged();
                    }),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(widget.item.image,
                width: 80, height: 80, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTapDown: (_) => setState(() => pressed = true),
      onTapUp: (_) => setState(() => pressed = false),
      onTapCancel: () => setState(() => pressed = false),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFF123D4A),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: Colors.white),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final double subtotal;
  final double shipping;
  final double percent;
  final double total;
  final double discount;
  final TextEditingController controller;
  final VoidCallback onApply;

  const OrderSummary({
    super.key,
    required this.subtotal,
    required this.shipping,
    required this.percent,
    required this.total,
    required this.discount,
    required this.controller,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [

          /// كوبون
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "ادخال كود الخصم",
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: onApply,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF7931E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("تنفيذ"),
              )
            ],
          ),

          const SizedBox(height: 18),

          _row("المجموع الفرعي", "$subtotal\$"),
          _row("مصاريف الشحن", "$shipping\$"),
          _row("رسوم الخدمة", "$percent%"),

          if (discount > 0)
            _row("الخصم", "-${discount.toStringAsFixed(0)}\$",
                color: Colors.green),

          const Divider(height: 28),

          _row("المجموع الكلي", "${total.toStringAsFixed(0)}\$",
              bold: true),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F2F3A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentScreen(),
                          ),
                        );
              },
              child: const Text("إتمام الطلب",
                  style: TextStyle(
                      fontFamily: "Almarai",
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _row(String t, String v,
      {bool bold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t,
              style: TextStyle(
                  fontFamily: "Almarai",
                  fontSize: 14,
                  fontWeight:
                      bold ? FontWeight.bold : FontWeight.w500)),
          Text(v,
              style: TextStyle(
                  fontFamily: "Almarai",
                  fontSize: 16,
                  color: color,
                  fontWeight:
                      bold ? FontWeight.bold : FontWeight.w600)),
        ],
      ),
    );
  }
}
