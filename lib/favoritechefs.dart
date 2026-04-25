import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: FavoriteChefsScreen(),
      ),
    );
  }
}

class FavoriteChefsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chefs = [
    {"name": "فاطمه الزهراء حسانين", "rating": "4.6"},
    {"name": "فاطمه الزهراء حسانين", "rating": "4.6"},
    {"name": "فاطمه الزهراء حسانين", "rating": "4.6"},
    {"name": "فاطمه الزهراء حسانين", "rating": "4.6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "شيفاتك المفضلة",
          style: TextStyle(
            color: Color(0xFF1F4E5F),
            fontWeight: FontWeight.bold,
            fontSize: 18, 
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F4E5F), size: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: chefs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12), 
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), 
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://sp.yimg.com/ib/th/id/OIP.F7JxURUyVezIXgHb4lCI7wHaFS?pid=Api&w=148&h=148&c=7&dpr=2&rs=1"),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chefs[index]["name"],
                          style: TextStyle(
                            fontSize: 14, 
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F4E5F),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "${chefs[index]["rating"]} ممتاز (245 تقييم)",
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 12),
                            Icon(Icons.star, color: Colors.orange, size: 12),
                            Icon(Icons.star, color: Colors.orange, size: 12),
                            Icon(Icons.star, color: Colors.grey[300], size: 12),
                            Icon(Icons.star, color: Colors.grey[300], size: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F4E5F),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}