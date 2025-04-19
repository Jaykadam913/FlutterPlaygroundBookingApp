import 'package:flutter/material.dart';

class GroupMembersPage extends StatelessWidget {
  final List<Member> members = [
    Member("Kishan", "assets/user1.jpg", 494, isAdmin: true),
    Member("Pratyush Kashyap", "assets/user2.jpg", 126, isMuted: true),
    Member("Manan Patel", "assets/user3.jpg", 50, isMuted: true),
    Member("Abhijit Gajbhiye", "assets/user4.jpg", 471, isMuted: true),
    Member("Vats", "assets/user5.jpg", 50, isMuted: true),
    Member("Suaryakant Panda", "assets/user6.jpg", 117, isMuted: true),
    Member("Jay Dave", "assets/user7.jpg", 86, isMuted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('57 Members', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Look for members in the group',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Members List
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                final member = members[index];
                return ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(member.avatarPath),
                    radius: 24,
                  ),
                  title: Row(
                    children: [
                      Text(
                        member.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      if (member.isAdmin)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Admin',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87)),
                          ),
                        ),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Text('Karma ',
                          style: TextStyle(color: Colors.grey.shade600)),
                      Text('${member.karma}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo)),
                    ],
                  ),
                  trailing: member.isMuted
                      ? Icon(Icons.volume_off_outlined, size: 20)
                      : null,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Member {
  final String name;
  final String avatarPath;
  final int karma;
  final bool isAdmin;
  final bool isMuted;

  Member(this.name, this.avatarPath, this.karma,
      {this.isAdmin = false, this.isMuted = false});
}
