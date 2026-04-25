import 'package:flutter/material.dart';
import 'package:linguini_app/home/home_root_page.dart';

class FoodPreferencesPage extends StatefulWidget {
  const FoodPreferencesPage({super.key});

  @override
  State<FoodPreferencesPage> createState() =>
      _FoodPreferencesPageState();
}

class _FoodPreferencesPageState
    extends State<FoodPreferencesPage> {
  List<String> allergies = [
  "مأكولات بحرية",
  "منتجات ألبان",
  "جلوتين",
  "بيض",
  "مكسرات",
  "مأكولات بحرية",
  "منتجات ألبان",
  "جلوتين",
  "بيض",
  "مكسرات",
];

List<String> favoriteFoods = [
  "صحي",
  "حار",
  "منخفض الكربوهيدرات",
  "بدون بصل",
  "صحي",
  "حار",
  "منخفض الكربوهيدرات",
  "بدون بصل",
];

  List<String> selectedAllergies = [];
  List<String> selectedFavorites = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [

                /// Logo
                Image.asset(
                  'images/Linguini00000.png',
                  height: 100,
                ),

                const SizedBox(height: 20),

                /// Card Container
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end,
                        children: [

                          /// Title
                          const Text(
                            "تفضيلاتك الغذائية",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Almarai',
                              color: Color(0xFF1b4a58),
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Text(
                            "ساعدنا في تحسين تجربتك باختيارك لما تفضله.",
                            style: TextStyle(
                              fontFamily: 'Almarai',
                              color: Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 25),

                          /// Allergies
                          const Text(
                            "هل لديك أي حساسية تجاه الطعام؟",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Almarai',
                              color: Color(0xFF1b4a58),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: allergies
                                .map((item) =>
                                    buildChip(item,
                                        selectedAllergies))
                                .toList(),
                          ),

                          const SizedBox(height: 25),

                          /// Favorites
                          const Text(
                            "اختر فئات طعامك المفضلة",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Almarai',
                              color: Color(0xFF1b4a58),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: favoriteFoods
                                .map((item) =>
                                    buildChip(item,
                                        selectedFavorites))
                                .toList(),
                          ),

                          const SizedBox(height: 35),

                          /// Create Button
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeRootPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF1b4a58),
                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(14),
                                ),
                              ),
                              child: const Text(
                                "إنشاء",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Almarai',
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          /// Skip
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeRootPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "تخطي الآن",
                                style: TextStyle(
                                  color:
                                      Color(0xffF7931E),
                                  fontFamily:
                                      'Almarai',
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
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

  Widget buildChip(
      String text, List<String> selectedList) {
    bool isSelected = selectedList.contains(text);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedList.remove(text);
          } else {
            selectedList.add(text);
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1b4a58)
              : Colors.grey.shade100,
          borderRadius:
              BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Almarai',
            color: isSelected
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}