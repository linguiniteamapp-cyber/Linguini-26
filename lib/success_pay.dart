import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String orderNumber;
  final String customerName;
  final String orderType;
  final String orderDate;
  final String totalAmount;
  final String deliveryFee;
  final String paymentMethod;

  const SuccessScreen({
    super.key,
    required this.orderNumber,
    required this.customerName,
    required this.orderType,
    required this.orderDate,
    required this.totalAmount,
    required this.deliveryFee,
    required this.paymentMethod,
  });

  static const Color mainColor = Color(0xff1F4E5F);
  static const Color successColor = Color(0xff3B7F59);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
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
        body: Column(
          children: [
            const SizedBox(height: 40),

            /// ✔ أيقونة الصح
            Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                color: successColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 75,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "عملية ناجحة",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: successColor,
              ),
            ),

            const SizedBox(height: 30),

            /// كارت التفاصيل
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Column(
                children: [
                  _row("رقم العملية", orderNumber),
                  _row("اسم العميل", customerName),
                  _row("نوع العملية", orderType),
                  _row("تاريخ العملية", orderDate),

                  const SizedBox(height: 8),

                  _row("المبلغ المدفوع", totalAmount,
                      valueColor: Colors.green),
                  _row("المبلغ المرتجع", deliveryFee,
                      valueColor: Colors.red),

                  _row("طريقة الدفع", paymentMethod),
                ],
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: successColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Navigator.popUntil(
                        context, (route) => route.isFirst);
                  },
                  child: const Text(
                    "عودة",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value,
      {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: valueColor ?? Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}