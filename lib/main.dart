import 'package:flutter/material.dart';
import 'flutter_custom_calendar_with_date_selection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Calendar')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomCalendar(
          controller: controller,
          onDateSelected: (date) {
            print("Selected Date: $date");
          },
        ),
      ),
    );
  }
}