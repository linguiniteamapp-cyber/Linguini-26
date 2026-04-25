import 'package:flutter/material.dart';
import 'chef_profile_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
TextEditingController searchController = TextEditingController();
String searchQuery = '';

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = 'الكل';
  String searchQuery = '';

  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> chefs = [
    
    {
      'name': 'مريم فتحي علي',
      'job': 'حلويات',
      'image': 'images/471.jpg',
      'rating': '4.5',
      'description': 'شيف حلويات محترفة...',
    },
    {
      'name': 'عبد الرحمن أبو مروه',
      'job': 'مشويات',
      'image': 'images/471.jpg',
      'rating': '4.5',
      'description': 'شيف حلويات محترفة...',
    },
    {
      'name': 'محمود النني',
      'job': 'مخبوزات',
      'image': 'images/5767260181195591002.jpg',
      'rating': '4.5',
      'description': 'شيف حلويات محترفة...',
    },
  ];

  final List<String> categories = [
    'الكل',
    'حلويات',
    'مشويات',
    'مخبوزات',
    'وجبات جاهزة',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredChefs = chefs.where((chef) {
      final name = chef['name']!.toLowerCase();
      final job = chef['job']!.toLowerCase();
      final query = searchQuery.toLowerCase();

      final matchesCategory =
          selectedCategory == 'الكل' || chef['job'] == selectedCategory;

      final matchesSearch =
          name.contains(query) || job.contains(query);

      return matchesCategory && matchesSearch;
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                const Center(
                  child: Text(
                    'البحث عن شيف',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Almarai',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1b4a58),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Search Field (LIVE)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'اسم الشيف...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Filters
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((cat) {
                      final isSelected = selectedCategory == cat;
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ChoiceChip(
                          label: Text(
                            cat,
                            style: TextStyle(
                              fontFamily: 'Almarai',
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                          selected: isSelected,
                          selectedColor: const Color(0xffF7931E),
                          backgroundColor: Colors.white,
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                /// Filtered Results
                ...filteredChefs.map(
                  (chef) => InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChefProfilePage(
                            name: chef['name']!,
                            image: chef['image']!,
                            job: chef['job']!,
                            rating: chef['rating']!,
                            description: chef['description']!,
                          ),
                        ),
                      );

                    },
                    child: _ChefTile(
                      name: chef['name']!,
                      job: chef['job']!,
                      image: chef['image']!,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                /// Top Chefs (NOT FILTERED)
                const Text(
                  'الشيفات الأعلى تقييم',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1b4a58),
                  ),
                ),

                const SizedBox(height: 12),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: .8,
                  children: const [
                    _TopChefCard(
                      name: 'إسماعيل محمد',
                      image: 'images/471.jpg',
                    ),
                    _TopChefCard(
                      name: 'أحمد علي',
                      image: 'images/471.jpg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChefTile extends StatelessWidget {
  final String name;
  final String job;
  final String image;

  const _ChefTile({
    required this.name,
    required this.job,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  job,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Almarai',
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
class _TopChefCard extends StatelessWidget {
  final String name;
  final String image;

  const _TopChefCard({
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Almarai',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
