import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeSelectorScreen extends StatelessWidget {
  const TimeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> timeSlots = [
      {
        'label': 'Morning',
        'time': '12am to 9am',
        'icon': Icons.wb_sunny_outlined
      },
      {'label': 'Day', 'time': '9am to 4pm', 'icon': Icons.wb_sunny},
      {'label': 'Evening', 'time': '4pm to 9pm', 'icon': Icons.wb_twilight},
      {'label': 'Night', 'time': '9pm to 12am', 'icon': Icons.nightlight_round},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Select a suitable time'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
              physics: const NeverScrollableScrollPhysics(),
              children: timeSlots.map((slot) {
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      Get.back(result: slot['time']);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(slot['icon'] as IconData,
                              size: 40, color: Colors.grey[700]),
                          const SizedBox(height: 8),
                          Text(slot['label'] ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(slot['time'] ?? '',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Or, you can also select a specific time',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'TIME',
                hintText: 'Pick exact time',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
