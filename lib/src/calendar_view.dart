import 'package:flutter/material.dart';
import 'calendar_controller.dart';
import 'calendar_style.dart';

class CustomCalendar extends StatefulWidget {
  final CalendarController controller;
  final CalendarStyle style;
  final Function(DateTime)? onDateSelected;

  const CustomCalendar({
    super.key,
    required this.controller,
    this.style = const CalendarStyle(),
    this.onDateSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final List<String> weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_refresh);
  }

  void _refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_refresh);
    super.dispose();
  }

  String getMonthName(int month) {
    const months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    final dates = widget.controller.getCalendarDates();

    return Column(
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: widget.controller.previousMonth,
              icon: const Icon(Icons.chevron_left),
            ),
            Text(
              "${getMonthName(widget.controller.currentMonth.month)} ${widget.controller.currentMonth.year}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: widget.controller.nextMonth,
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Week Days Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays
              .map((e) => Text(e, style: const TextStyle(fontWeight: FontWeight.bold)))
              .toList(),
        ),

        const SizedBox(height: 10),

        // Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dates.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            final item = dates[index];

            final isCurrentMonth =
                item.date.month == widget.controller.currentMonth.month;

            Color bgColor = Colors.transparent;

            if (item.isSelected) {
              bgColor = widget.style.selectedColor;
            } else if (widget.controller.isInRange(item.date)) {
              bgColor = widget.style.selectedColor.withOpacity(0.3);
            } else if (item.isToday) {
              bgColor = widget.style.todayColor;
            }

            return GestureDetector(
              onTap: () {
                widget.controller.selectDate(item.date);
                widget.onDateSelected?.call(item.date);
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${item.date.day}",
                      style: TextStyle(
                        color: isCurrentMonth ? Colors.black : Colors.grey,
                        fontWeight: item.isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),

                    // 🔴 Event Dot Example
                    if (item.date.day % 5 == 0)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}