import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> activities = [
    {'icon': Icons.sports_esports, 'label': 'Paintball'},
    {'icon': Icons.rice_bowl_outlined, 'label': 'Bowling'},
    {'icon': Icons.fitness_center, 'label': 'Workout'},
    {'icon': Icons.self_improvement, 'label': 'Yoga'},
    {'icon': Icons.pool, 'label': 'Pool'},
    {'icon': Icons.sports_cricket, 'label': 'Cricket'},
    {'icon': Icons.sports_tennis, 'label': 'Tennis'},
    {'icon': Icons.pool, 'label': 'Swimming'},
  ];

  final List<Map<String, dynamic>> fitnessActivities = [
    {'icon': Icons.pool, 'label': 'Swimming'},
    {'icon': Icons.self_improvement, 'label': 'Yoga'},
    {'icon': Icons.fitness_center, 'label': 'Workout'},
    {'icon': Icons.directions_run, 'label': 'Running'},
    {'icon': Icons.directions_bike, 'label': 'Cycling'},
    {'icon': Icons.sports_gymnastics, 'label': 'Gymming'},
    {'icon': Icons.sports_mma, 'label': 'Combat Sports'},
    {'icon': Icons.directions_walk, 'label': 'Zumba'},
  ];

  final List<Map<String, dynamic>> teamSports = [
    {'icon': Icons.sports_soccer, 'label': 'Football'},
    {'icon': Icons.sports_basketball, 'label': 'Basketball'},
    {'icon': Icons.sports_baseball, 'label': 'Baseball'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type 'Football'",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle('Activities'),
                    activityGrid(activities),
                    sectionTitle('Fitness', checkbox: true),
                    activityGrid(fitnessActivities),
                    sectionTitle('Team Sports', checkbox: true),
                    activityGrid(teamSports),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, {bool checkbox = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          if (checkbox)
            Checkbox(
              value: false,
              onChanged: (val) {},
            ),
        ],
      ),
    );
  }

  Widget activityGrid(List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 1.2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.back(result: items[index]['label']);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    items[index]['icon'],
                    size: 30,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  items[index]['label'],
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
