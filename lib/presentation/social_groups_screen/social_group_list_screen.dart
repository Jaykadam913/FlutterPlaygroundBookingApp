import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/social_groups_screen/group_members_screen.dart';
import 'package:get/get.dart';

import 'group_details_screen.dart';

class GroupsPage extends StatelessWidget {
  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Game Changers'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            child: Text('Message'),
            onPressed: () {
              Navigator.pop(context);
              // Add your action
            },
          ),
          CupertinoActionSheetAction(
            child: Text('About Group'),
            onPressed: () {
              Navigator.pop(context);
              // Add your action
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Create Game'),
            onPressed: () {
              Navigator.pop(context);
              // Add your action
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Mute'),
            onPressed: () {
              Navigator.pop(context);
              // Add your action
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Groups',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green),
              onPressed: () {}),
        ],
        backgroundColor: Color(0xFF1D2F2F),
      ),
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(GroupDetailsScreen());
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/badminton.jpeg'), // Use your image asset here
                ),
                title: Text('Game Changers',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('Public • 57 Members'),
                trailing: IconButton(
                    onPressed: () => _showActionSheet(context),
                    icon: Icon(Icons.more_vert)),
              );
            },
            shrinkWrap: true,
            itemCount: 1,
          ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text('Explore more groups',
                  style: TextStyle(color: Colors.green)),
            ),
          ),
        ],
      ),
    );
  }
}
