import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/routes/app_routes.dart';
import 'package:get/get.dart';

class SkillLevelPage extends StatefulWidget {
  const SkillLevelPage({super.key});

  @override
  State<SkillLevelPage> createState() => _SkillLevelPageState();
}

class _SkillLevelPageState extends State<SkillLevelPage> {
  String selectedLevel = 'Intermediate';
  List<String> selectedLabel = [];

  Widget skillButton(String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedLabel.add(label)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
          decoration: BoxDecoration(
            color:
                selectedLabel.contains(label) ? Colors.teal[300] : Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
                  selectedLabel.contains(label) ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9f9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'How good are you at these',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.profileSetupScreen);
              },
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Get.arguments['icon'], style: TextStyle(fontSize: 25)),
                SizedBox(width: 15),
                Text(
                  Get.arguments['name'],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                skillButton("Beginner"),
                skillButton("Intermediate"),
                skillButton("Advanced"),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  skillButton("Beginner +"),
                  skillButton("Intermediate +"),
                  skillButton("Advanced +"),
                ],
              )),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
