import 'package:flutter/material.dart';
import 'package:linguini_app/success_pay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Almarai'),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static const Color mainColor = Color(0xff1F4E5F);
  static const Color bgColor = Color(0xffF2F2F2);
  static const Color greyFieldColor = Color(0xffE1E3E6);

  final nameController =
      TextEditingController(text: "منار هارون رمسيس");
  final countryController = TextEditingController(
      text: "الدولة : مصر\nمحافظة : اسيوط");
  final addressController = TextEditingController(
      text:
          "مصر - اسيوط - الوليديه\nتقسيم القاضي - مسجد\nانس بن مالك");
  final phoneController =
      TextEditingController(text: "01092267949");

  final chefController =
      TextEditingController(text: "شيف بوراك");
  final totalController =
      TextEditingController(text: "165 جنيه");
  final deliveryController = TextEditingController(
      text: "الاثنين, 28 ابريل الساعة 3");

  @override
  void dispose() {
    nameController.dispose();
    countryController.dispose();
    addressController.dispose();
    phoneController.dispose();
    chefController.dispose();
    totalController.dispose();
    deliveryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bgColor,
       appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "الدفع",
            style: TextStyle(
              color: mainColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
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
        body: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildLabel("اسم العميل"),
              _buildField(nameController),
              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _buildLabel("البلد"),
                        _buildField(countryController,
                            maxLines: 3),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _buildLabel("العنوان بالتفاصيل"),
                        _buildField(addressController,
                            maxLines: 3),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              _buildLabel("رقم الموبايل"),
              _buildField(phoneController,
                  keyboard: TextInputType.phone),

              const SizedBox(height: 10),

              _buildLabel("اسم الشيف"),
              _buildField(
                chefController,
                readOnly: true,
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _buildLabel("الاجمالي"),
                        _buildField(
                          totalController,
                          readOnly: true,
                          isBold: true,
                          textColor: mainColor,
                          alignCenter: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        _buildLabel("معاد التوصيل"),
                        _buildField(
                        deliveryController,
                        readOnly: true,
                        alignCenter: true,
                        fontSize: 13,
                        maxLines: 2, // 👈 مهم جدا
                      ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              const Center(
                child: Text(
                  "امكانية الدفع",
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment:
                          WrapAlignment.center,
                      children: [
                        _buildPaymentLogo(
                            "VISA",
                            const Color(0xff1A1ADB)),
                        _buildPaymentLogo(
                            "PayPal",
                            Colors.blue),
                        _buildPaymentLogo(
                            "Master",
                            Colors.orange),
                        _buildPaymentLogo(
                            "VF Cash",
                            Colors.red),
                      ],
                    ),

                    const SizedBox(height: 18),

                    const Text(
                      "vodafone cash",
                      style: TextStyle(
                        fontSize: 22,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: greyFieldColor,
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                totalController.text,
                                style: const TextStyle(
                                  color: mainColor,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 45,
                            padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 12),
                            decoration: BoxDecoration(
                              color: greyFieldColor,
                              borderRadius:
                                  BorderRadius.circular(8),
                            ),
                            alignment:
                                Alignment.centerRight,
                            child: const Text(
                              "رقم الهاتف",
                              style: TextStyle(
                                  color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              mainColor,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SuccessScreen(
        orderNumber: DateTime.now()
            .millisecondsSinceEpoch
            .toString()
            .substring(5), // رقم عشوائي
        customerName: nameController.text,
        orderType: "شراء",
        orderDate:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
        totalAmount: totalController.text,
        deliveryFee: "0 جنيه",
        paymentMethod: "PayPal",
      ),
    ),
  );
},
                        child: const Text(
                          "دفع",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Almarai',
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Padding(
        padding:
            const EdgeInsets.only(bottom: 4, right: 4),
        child: Text(
          text,
          style: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.bold),
        ),
      );

  Widget _buildField(
    TextEditingController controller, {
    bool readOnly = false,
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
    bool isBold = false,
    Color? textColor,
    bool alignCenter = false,
    double fontSize = 14,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: readOnly
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        keyboardType: keyboard,
        textAlign:
            alignCenter ? TextAlign.center : TextAlign.right,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ?? Colors.black87,
          fontWeight:
              isBold ? FontWeight.bold : FontWeight.normal,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10),
        ),
      ),
    );
  }

  Widget _buildPaymentLogo(
      String label, Color color) {
    return Container(
      width: 60,
      height: 35,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}