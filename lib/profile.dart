import 'package:flutter/material.dart';
import 'package:linguini_app/signup_temp.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

// ================= Profile Screen =================

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _bottomNavBar(),
      body: Column(
        children: [
          _header(),
          const SizedBox(height: 16),
          _tabs(),
          const SizedBox(height: 16),
          _addCard(),
        ],
      ),
    );
  }

  // ================= Header =================
  Widget _header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1C),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.settings, color: Colors.white),
              Row(
                children: [
                  Icon(Icons.share, color: Colors.white),
                  SizedBox(width: 12),
                  Icon(Icons.notifications_none, color: Colors.white),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 35, color: Colors.black),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Mai Mostafa",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "@maimostafa711 • ⭐ N/A (0)",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Cairo, (El Rehab City 1)",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "No bio available",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Icon(Icons.store, color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child:
                    const Icon(Icons.favorite_border, color: Colors.white),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Column(
                children: [
                  Text("0",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Followers", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text("0",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("Following", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // ================= Tabs =================
  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _tabItem("All", true),
          const SizedBox(width: 10),
          _tabItem("Collections", false),
        ],
      ),
    );
  }

  Widget _tabItem(String title, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: active ? Colors.green : Colors.grey),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: active ? Colors.green : Colors.grey),
      ),
    );
  }

  // ================= Add Card =================
  Widget _addCard() {
    return Expanded(
      child: Center(
        child: Container(
          width: 160,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 30),
              SizedBox(height: 8),
              Text("Add"),
            ],
          ),
        ),
      ),
    );
  }

  // ================= Bottom Nav =================
  Widget _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 3,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
    );
  }
}
