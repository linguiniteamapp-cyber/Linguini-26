import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final bool isSelected;

  const ProductCard({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected
              ? const Color.fromARGB(255, 255, 255, 255)
              : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Image
          Container(
            height: 95,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          /// Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'وجبة مميزة',
              style: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 4),

          /// Price
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '50 ج',
              style: TextStyle(
                color: Color(0xffF7931E),
                fontFamily: 'Almarai',
              ),
            ),
          ),

          const Spacer(),

          /// Rating & Add
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(Icons.star,
                    size: 14, color: Color(0xffF7931E)),
                const SizedBox(width: 4),
                const Text('4.8'),
                const Spacer(),
                Container(
                  width: 32,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1b4a58),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add,
                      size: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
