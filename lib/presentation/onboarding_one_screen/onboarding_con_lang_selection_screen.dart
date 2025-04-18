import 'package:flutter/material.dart';
import 'package:flutter_playground_booking_app/core/utils/pref_utils.dart';

class OnboardingConLangScreen extends StatefulWidget {
  const OnboardingConLangScreen({super.key});

  @override
  State<OnboardingConLangScreen> createState() =>
      _OnboardingConLangScreenState();
}

class _OnboardingConLangScreenState extends State<OnboardingConLangScreen> {
  String selectedCountry = 'India';
  String selectedLanguage = 'English';

  final List<String> countries = ['India', 'USA', 'UK', 'Canada'];
  final List<String> languages = ['English', 'Hindi', 'Spanish', 'French'];

  Future<void> completeOnboarding(BuildContext context) async {
    PrefUtils.setIsIntro(false);
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Welcome Onboard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              DropdownButtonFormField<String>(
                decoration: _boxDecoration(),
                value: selectedCountry,
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: _boxDecoration(),
                value: selectedLanguage,
                items: languages.map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Next button action
                    completeOnboarding(context);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _boxDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
