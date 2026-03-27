class CalendarDate {
  final DateTime date;
  final bool isSelected;
  final bool isToday;

  CalendarDate({
    required this.date,
    this.isSelected = false,
    this.isToday = false,
  });

  CalendarDate copyWith({
    bool? isSelected,
    bool? isToday,
  }) {
    return CalendarDate(
      date: date,
      isSelected: isSelected ?? this.isSelected,
      isToday: isToday ?? this.isToday,
    );
  }
}