import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Color(0xFF1b4a58),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _icons[index],
                      height: 24,
                      color: currentIndex == index
                          ? const Color(0xffF7931E)
                          : Colors.white,
                    ),
                    const SizedBox(height: 4),
                    if (currentIndex == index)
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xffF7931E),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

const List<String> _icons = [
  'images/delivery.png',
  'images/cart.png',
  'images/home.png',
  'images/chef.png',
  'images/profile.png',
];
