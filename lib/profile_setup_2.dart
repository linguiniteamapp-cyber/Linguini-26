import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:linguini_app/login.dart';
import 'package:linguini_app/models/user_model.dart';
import 'package:linguini_app/preferences_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddressScreen(),
    );
  }
}

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, UserModel? user, String? role});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController governorateController =
      TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController =
      TextEditingController();
  final TextEditingController apartmentController =
      TextEditingController();
  final TextEditingController landmarkController =
      TextEditingController();

  Future<void> detectLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude);

    Placemark place = placemarks.first;

    setState(() {
      governorateController.text = place.administrativeArea ?? "";
      cityController.text = place.locality ?? "";
      streetController.text = place.street ?? "";
    });
  }

  @override
  void dispose() {
    governorateController.dispose();
    cityController.dispose();
    streetController.dispose();
    buildingController.dispose();
    apartmentController.dispose();
    landmarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Color(0xff1F4E5F)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "أين نوصل طعامك؟",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F4E5F),
                      fontFamily: 'Almarai',
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    "أضف عنوان التوصيل الخاص بك لتسريع عملية الطلب",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1F4E5F),
                      fontFamily: 'Almarai',
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// زرار تحديد الموقع
                GestureDetector(
                  onTap: detectLocation,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.circular(25),
                            ),
                            child: const Text(
                              "الكشف",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Almarai',
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            "أستخدم موقعي الحالي",
                            style: TextStyle(
                              color: Color(0xff1F4E5F),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Almarai',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                buildTextField("المحافظة",
                    controller: governorateController),
                const SizedBox(height: 12),
                buildTextField("المدينة أو المنطقة",
                    controller: cityController),
                const SizedBox(height: 12),
                buildTextField("أدخل اسم الشارع",
                    controller: streetController),
                const SizedBox(height: 12),
                buildTextField("رقم المبنى أو العمارة(اختياري)",
                    controller: buildingController),
                const SizedBox(height: 12),
                buildTextField("الدور و رقم الشقة(اختياري)",
                    controller: apartmentController),
                const SizedBox(height: 12),
                buildTextField("معلم قريب (اختياري)",
                    controller: landmarkController),
                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xff1F4E5F),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const FoodPreferencesPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "احفظ و تابع",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        'تخطي الآن',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Color(0xffF7931E),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint,
      {required TextEditingController controller}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}