import 'dart:developer';

import 'package:flutter/material.dart';
import 'utils/constants/app_colors/app_colors.dart';

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Basics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TableCalendar(
            //   firstDay: DateTime.utc(2010, 10, 16),
            //   lastDay: DateTime.utc(2024, 11, 14),
            //   focusedDay: _focusedDay,
            //   calendarFormat: _calendarFormat,
            //   selectedDayPredicate: (day) {
            //     return isSameDay(_selectedDay, day);
            //   },
            //   onDaySelected: (selectedDay, focusedDay) {
            //     if (!isSameDay(_selectedDay, selectedDay)) {
            //       // Call `setState()` when updating the selected day
            //       setState(() {
            //         _selectedDay = selectedDay;
            //         _focusedDay = focusedDay;
            //       });
            //     }
            //   },
            //   onFormatChanged: (format) {
            //     if (_calendarFormat != format) {
            //       // Call `setState()` when updating calendar format
            //       setState(() {
            //         _calendarFormat = format;
            //       });
            //     }
            //   },
            //   onPageChanged: (focusedDay) {
            //     // No need to call `setState()` here
            //     _focusedDay = focusedDay;
            //   },
            // ),
            InkWell(
              onTap: () {
                log("${Duration(days: 365*13)}");
                showDatePicker(context: context,
                    firstDate: DateTime.utc(2000),
                    lastDate: DateTime.now().subtract(const Duration(days: 365*13)),
                  onDatePickerModeChange: (datePickerEntryMode){
                  log("${datePickerEntryMode.runtimeType}");
                  },
                  helpText: "Select Date Of Birth",
                    builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light(
                      useMaterial3: true, // Keeping Material 3 disabled if preferred
                    ).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.blue3D4A7A, // Header and selected date highlight
                        onPrimary: Colors.white,       // Text color in the header
                        surface: AppColors.blue3D4A7A, // Calendar background color
                        onSurface: Colors.black,       // Day text color
                        secondary: AppColors.blue3D4A7A, // Could be used for button highlights, etc.
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.blue3D4A7A, // "OK" and "CANCEL" button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
                ).then((pickedDate){
                  if (pickedDate != null){
                    final currentDate = DateTime.now();
                    final userAge = currentDate.year - pickedDate.year;
                    if (userAge >= 13) {
                      // The user is 13 or older
                      log("Valid age: $userAge years old.");
                      log("Date ${pickedDate.toLocal()}");
                    } else {
                      // The user is younger than 13
                      log("User is under 13: $userAge years old.");
                      // Handle the case (e.g., show a warning or prevent further action)
                    }
                  }
                });
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}