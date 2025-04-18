import 'package:flutter/material.dart';

class LocationSelectorPage extends StatefulWidget {
  @override
  _LocationSelectorPageState createState() => _LocationSelectorPageState();
}

class _LocationSelectorPageState extends State<LocationSelectorPage> {
  String _selectedLocation = 'Simei MRT Station (EW3)';
  double _distance = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Your location',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Manage',
                style: TextStyle(color: Colors.teal, fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RadioListTile<String>(
              value: 'Current location',
              groupValue: _selectedLocation,
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value!;
                });
              },
              title: Text('Current location'),
              secondary: Icon(Icons.my_location_outlined, color: Colors.teal),
            ),
            RadioListTile<String>(
              value: 'Simei MRT Station (EW3)',
              groupValue: _selectedLocation,
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value!;
                });
              },
              title: Text('Simei MRT Station (EW3)'),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // add new location logic
              },
              icon: Icon(Icons.add, color: Colors.teal),
              label: Text('Add new location',
                  style: TextStyle(color: Colors.teal)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                side: BorderSide(color: Colors.teal.shade100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Distance to your location'),
                    Text('${_distance.toStringAsFixed(2)} km'),
                  ],
                ),
                Slider(
                  value: _distance,
                  min: 1,
                  max: 50,
                  divisions: 49,
                  activeColor: Colors.teal,
                  onChanged: (value) {
                    setState(() {
                      _distance = value;
                    });
                  },
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // apply location logic
                      Navigator.pop(context);
                    },
                    child: Text(
                      'APPLY',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
