import 'package:flutter/material.dart';
import 'package:linguini_app/Review.dart';

class ChefProfilePage extends StatelessWidget {
  final String name;
  final String job;
  final String image;
  final String rating;
  final String description;

  const ChefProfilePage({
    super.key,
    required this.name,
    required this.job,
    required this.image,
    required this.rating,
    required this.description,

  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// ================= HEADER IMAGE =================
                Stack(
                  children: [
                    Image.asset(
                      image,
                      height: 260,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 260,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),

                    Positioned(
                      top: 16,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Almarai',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            job,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Almarai',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// ================= INFO CARD =================
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const _InfoItem(title: '2025', subtitle: 'عضو منذ'),

                      _InfoItem(
                        title: '4.6',
                        subtitle: 'التقييم',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewPage(),
                            ),
                          );
                        },
                      ),

                      const _InfoItem(title: '1.5K', subtitle: 'إعجابات'),
                    ],
                  ),
                ),

                /// ================= DESCRIPTION =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'نبذة عن الشيف',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'شيف محترف بخبرة أكثر من 10 سنوات في إعداد المخبوزات والحلويات الشرقية والغربية بجودة عالية.',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                /// ================= FOODS =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'أكلاتي',
                        style: TextStyle(
                          fontFamily: 'Almarai',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 12),
                      _FoodItem(),
                      _FoodItem(),
                      _FoodItem(),
                    ],
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

/// ================= INFO ITEM =================
class _InfoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _InfoItem({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Almarai',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Almarai',
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= FOOD ITEM =================
class _FoodItem extends StatelessWidget {
  const _FoodItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'images/food.png',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 90,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.fastfood),
                );
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الصينية بالبشاميل',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'وجبة مميزة تكفي فردين',
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Text(
                      '75 ج',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffF7931E),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, size: 18),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 32,
                  width: 80,
                  child: ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1b4a58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'طلب',
                      style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
