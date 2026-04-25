import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Image.asset(
            'images/Linguini00000.png',
            height: 42,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'محادثاتك',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1b4a58),
                ),
              ),
            ),

            /// قائمة المحادثات
            Expanded(
              child: ListView.separated(
                itemCount: 12,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    thickness: 1,
                    height: 1,
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                itemBuilder: (context, index) {
                  return _chatItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatItem() {
    return InkWell(
      onTap: () {
        // فتح صفحة الشات
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            /// صورة المستخدم (يمين)
            const CircleAvatar(
              radius: 24,
              // backgroundImage: AssetImage('images/user.png'),
            ),

            const SizedBox(width: 12),

            /// الاسم + آخر رسالة
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'عبد الرحمن رمضان',
                    style: TextStyle(
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF1b4a58),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'آخر رسالة وصلت إليك...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Almarai',
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// عداد الرسائل
            Container(
              height: 22,
              width: 22,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF1b4a58),
                shape: BoxShape.circle,
              ),
              child: const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Almarai',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
