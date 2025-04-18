import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/presentation/create_game/game_selection_screen.dart';
import 'package:flutter_playground_booking_app/presentation/create_game/location_screen.dart';
import 'package:get/get.dart';

import 'custom_date_selection_widget.dart';
import 'time_selector_screen.dart';

class CreateGameScreen extends StatefulWidget {
  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  bool inviteOnly = true;
  // final SportController controller = Get.put(SportController());
  TextEditingController sportController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     Navigator.of(cont)
        //   },
        // ),
        title: Text('Create Game', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            gameOptionTile(Icons.sports_soccer, 'Sport', () async {
              final selected = await Get.to(() => GameSelectionScreen());
              if (selected != null) {
                sportController.text = selected;
                setState(() {});
              }
            }, sportController, 'Eg. Badminton/Tennis/Football'),
            gameOptionTile(Icons.location_on, 'Area', () async {
              final location = await Get.to(() => LocationScreen());
              if (location != null) {
                areaController.text = location;
              }
            }, areaController, 'Locality or Venue Name'),
            gameOptionTile(Icons.calendar_today, 'Date', () async {
              final date = await Get.to(() => CustomDateSelectionWidget());
              if (date != null) {
                dateController.text = date;
              }
            }, dateController, 'Pick a day'),
            gameOptionTile(Icons.access_time, 'Time', () async {
              final time = await Get.to(() => TimeSelectorScreen());
              if (time != null) {
                timeController.text = time;
              }
            }, timeController, 'Pick Exact Time'),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.door_front_door_outlined),
                SizedBox(width: 8),
                Text('Activity Access',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() => inviteOnly = true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: inviteOnly
                          ? Colors.green.shade50
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: Colors.green),
                        Text('Invite Only',
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.info_outline, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'The game will be restricted to invited players and can be accessed by anyone via shared link.',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // gameOptionTile(Icons.settings, 'Advanced Settings', () {}),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 28),
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Text('Create Game',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
      ),
    );
  }

  Widget gameOptionTile(IconData icon, String title, VoidCallback onTapItem,
      TextEditingController controller, String hint) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon),
          title: Text(title),
          dense: true,
          subtitle: IgnorePointer(
              ignoring: true,
              child: TextFormField(
                controller: controller,
                readOnly: true,
                decoration:
                    InputDecoration(border: InputBorder.none, hintText: hint),
              )),
          trailing: Icon(Icons.chevron_right),
          onTap: onTapItem,
        ),
        Divider(height: 1),
      ],
    );
  }
}
