import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/social_groups_screen/group_members_screen.dart';
import 'package:get/get.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Section (Dark background)
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, bottom: 20),
            color: Color(0xFF1E2B26), // Dark green/black tone
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 36,
                  backgroundImage: AssetImage("assets/images/badminton.jpg"),
                ),
                SizedBox(height: 12),
                Text(
                  'Game Changers',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Let's plan games!!!",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          // Main Details Section
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Members row
                GestureDetector(
                  onTap: () {
                    Get.to(GroupMembersPage());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.group, size: 18),
                      SizedBox(width: 8),
                      Text(
                        '57 Members',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.purple,
                              child: Text("S",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white))),
                          Positioned(
                              left: 16,
                              child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage('assets/user1.jpg'))),
                          Positioned(
                              left: 32,
                              child: CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage('assets/user2.jpg'))),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 14),
                    ],
                  ),
                ),
                Divider(height: 32),

                // Location info
                Row(
                  children: [
                    Icon(Icons.square_rounded, size: 12),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ahmedabad, Gujarat, India"),
                        Text("Preferred Active Region",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                Divider(height: 32),

                // Mute switch
                Row(
                  children: [
                    Icon(Icons.volume_up_outlined, color: Colors.grey.shade600),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mute Message Board",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                          Text("Notifications receiving is ON",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    Switch(value: false, onChanged: (val) {}),
                  ],
                ),
              ],
            ),
          ),

          Spacer(),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.red),
                  label:
                      Text("Exit Group", style: TextStyle(color: Colors.red)),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.report_gmailerrorred, color: Colors.red),
                  label:
                      Text("Report Group", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
