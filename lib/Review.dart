import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ReviewPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  final Color primaryDark = const Color(0xFF1D4D54);
  final Color accentTurquoise = const Color.fromARGB(255, 56, 159, 167);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 0.5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("images/5767260181195591002.jpg"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('فاطمه الزهراء حسانين', style: TextStyle(fontWeight: FontWeight.bold, color: primaryDark, fontSize: 13,fontFamily: 'Almarai')),
                          const Text('4.6 ممتاز (245 تقييم)', style: TextStyle(color: Colors.grey, fontSize: 10)),
                          buildStars(3, size: 10, isYellow: true),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(color: primaryDark, shape: BoxShape.circle),
                        child: const Icon(Icons.arrow_forward, color: Colors.white, size: 14),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Text(
                  'ملخص التقييمات',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: primaryDark,fontFamily: 'Almarai'),
                ),
              ),
              const SizedBox(height: 15),

              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            buildRatingRow('4 نجوم', 0.35, '35%'),
                            buildRatingRow('3 نجوم', 0.40, '40%'),
                            buildRatingRow('2 نجوم', 0.20, '20%'),
                            buildRatingRow('1 نجمة', 0.05, '0%'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.6',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: primaryDark,
                                height: 1.1,
                              ),
                            ),
                            buildStars(3, size: 18, alignment: MainAxisAlignment.center, isYellow: true),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('21%', style: TextStyle(fontSize: 11, color: primaryDark, fontWeight: FontWeight.bold)),
                                Text( '5 نجوم', style: TextStyle(fontSize: 11, color: primaryDark)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 0.21,
                                minHeight: 12,
                                backgroundColor: Colors.grey[200],
                                valueColor: AlwaysStoppedAnimation<Color>(accentTurquoise),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

       
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => buildReviewCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStars(double rating, {double size = 12, MainAxisAlignment alignment = MainAxisAlignment.start, bool isYellow = false}) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(5, (index) => Icon(
        index < rating ? Icons.star : Icons.star_border,
        color: index < rating ? (isYellow ? Colors.amber : primaryDark) : Colors.grey[300],
        size: size,
      )),
    );
  }

  Widget buildRatingRow(String label, double progress, String percentText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 10, color: primaryDark)),
              Text(percentText, style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(accentTurquoise),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildReviewCard() {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6uU_V08Vl7R_qQ9Z2q1_C-x_S-v8m1_S8XA&s'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('فاطمه الزهراء حسانين', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryDark, fontFamily: 'Almarai')),
                  buildStars(3, size: 10, isYellow: true),
                  const SizedBox(height: 6),
                  Text(
                    'جميل جداً',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: primaryDark, fontFamily: 'Almarai')),
                  
                  const SizedBox(height: 2),
                  const Text('منذ أسبوع', style: TextStyle(color: Colors.grey, fontSize: 9)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}