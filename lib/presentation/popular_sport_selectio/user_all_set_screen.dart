import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/routes/app_routes.dart';

class YouAreAllSetScreen extends StatelessWidget {
  const YouAreAllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top image with rounded bottom
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Image.asset(
              'assets/images/badminton.jpeg', // Replace with your image asset path
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "You're all set.",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Start using sport to find and organize activities and get more active.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to next screen
                  Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3EC6C1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "LET'S GO",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
