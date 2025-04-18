import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomDateSelectionWidget extends StatefulWidget {
  const CustomDateSelectionWidget({super.key});

  @override
  State<CustomDateSelectionWidget> createState() =>
      _CustomDateSelectionWidgetState();
}

class _CustomDateSelectionWidgetState extends State<CustomDateSelectionWidget> {
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  int _daysInMonth(DateTime date) {
    final firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  String formatDateWithSuffix(DateTime date) {
    String day = date.day.toString();
    String suffix = 'th';

    if (!(day.endsWith('11') || day.endsWith('12') || day.endsWith('13'))) {
      if (day.endsWith('1'))
        suffix = 'st';
      else if (day.endsWith('2'))
        suffix = 'nd';
      else if (day.endsWith('3')) suffix = 'rd';
    }

    String month = DateFormat('MMM').format(date); // Apr, May, etc.
    String year = DateFormat('y').format(date); // 2025

    return "$day$suffix $month $year";
  }

  List<Widget> _buildDateGrid() {
    final totalDays = _daysInMonth(_currentMonth);
    final firstWeekday =
        DateTime(_currentMonth.year, _currentMonth.month, 1).weekday;

    // Adjusting for Sunday-starting calendar (optional)
    final leadingEmptyDays = firstWeekday % 7;

    List<Widget> gridItems = [];

    // Empty boxes before the 1st
    for (int i = 0; i < leadingEmptyDays; i++) {
      gridItems.add(const SizedBox.shrink());
    }

    // Date buttons
    for (int i = 1; i <= totalDays; i++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, i);
      final isSelected = _selectedDate?.day == i &&
          _selectedDate?.month == _currentMonth.month &&
          _selectedDate?.year == _currentMonth.year;

      gridItems.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = date;
              String formattedDate =
                  formatDateWithSuffix(_selectedDate ?? DateTime.now());
              Get.back(result: formattedDate);
            });
          },
          child: Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green : Colors.transparent,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "$i",
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }

    return gridItems;
  }

  @override
  Widget build(BuildContext context) {
    final monthYear =
        DateFormat.yMMMM().format(_currentMonth); // e.g. "April 2025"

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top bar with month and arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: _goToPreviousMonth,
                ),
                Text(
                  monthYear,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: _goToNextMonth,
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Weekday headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => Expanded(
                  child: Center(
                    child: Text(
                      DateFormat.E()
                          .format(DateTime(2023, 1, index + 1)), // Sun, Mon...
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Calendar grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 7,
                children: _buildDateGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
