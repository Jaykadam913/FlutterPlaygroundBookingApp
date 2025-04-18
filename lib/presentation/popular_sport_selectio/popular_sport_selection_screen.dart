import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/routes/app_routes.dart';
import 'package:get/get.dart';

class SportsSelectionScreen extends StatelessWidget {
  SportsSelectionScreen({super.key});

  String defaultSelection = 'Football';

  final List<Map<String, String>> sports = const [
    {'name': 'Football', 'icon': '⚽'},
    {'name': 'Badminton', 'icon': '🏸'},
    {'name': 'Table Tennis', 'icon': '🏓'},
    {'name': 'Football', 'icon': '⚽'},
    {'name': 'Badminton', 'icon': '🏸'},
    {'name': 'Table Tennis', 'icon': '🏓'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'What Sports do you play?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.selectSportSkillScreen,
                    arguments: sports[0]);
              },
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.teal, fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for a sports',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Sport',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                children: sports.map((sport) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.selectSportSkillScreen,
                          arguments: sport);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            sport['icon']!,
                            style: const TextStyle(fontSize: 32),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            sport['name']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
