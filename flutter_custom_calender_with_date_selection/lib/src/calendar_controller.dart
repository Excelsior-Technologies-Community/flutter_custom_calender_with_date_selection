import 'package:flutter/material.dart';
import 'calendar_model.dart';

class CalendarController extends ChangeNotifier {
  DateTime _currentMonth = DateTime.now();

  DateTime? _startDate;
  DateTime? _endDate;

  DateTime get currentMonth => _currentMonth;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  void nextMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    notifyListeners();
  }

  void previousMonth() {
    _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    notifyListeners();
  }

  void selectDate(DateTime date) {
    _startDate = date;
    _endDate = null;
    notifyListeners();
  }


  bool isInRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!) && date.isBefore(_endDate!);
  }

  List<CalendarDate> getCalendarDates() {
    final firstDayOfMonth =
    DateTime(_currentMonth.year, _currentMonth.month, 1);

    final startWeekday = firstDayOfMonth.weekday; // Mon=1

    final daysInMonth =
        DateTime(_currentMonth.year, _currentMonth.month + 1, 0).day;

    List<CalendarDate> dates = [];

    // Previous month dates
    for (int i = 0; i < startWeekday - 1; i++) {
      final date = firstDayOfMonth.subtract(Duration(days: startWeekday - i - 1));
      dates.add(CalendarDate(date: date));
    }

    // Current month
    for (int i = 0; i < daysInMonth; i++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, i + 1);

      dates.add(CalendarDate(
        date: date,
        isToday: _isSame(date, DateTime.now()),
        isSelected: _isSame(date, _startDate) || _isSame(date, _endDate),
      ));
    }

    // Fill remaining
    while (dates.length % 7 != 0) {
      final last = dates.last.date;
      dates.add(CalendarDate(date: last.add(const Duration(days: 1))));
    }

    return dates;
  }

  bool _isSame(DateTime a, DateTime? b) {
    if (b == null) return false;
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }
}