import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatelessWidget {
  final DateTime selectedDay;

  const CalenderScreen({Key? key, required this.selectedDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(width: 0.5, color: Colors.white),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TableCalendar(
          firstDay: DateTime.utc(2025, 3, 1),
          lastDay: DateTime.utc(2025, 3, 31),
          focusedDay: selectedDay,
          selectedDayPredicate: (day) => isSameDay(selectedDay, day),
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Colors.orange, // 선택된 날짜 배경색
              shape: BoxShape.circle, // 원형
            ),
            todayDecoration: BoxDecoration(
              color: Colors.blue, // 오늘 날짜 배경색
              shape: BoxShape.circle,
            ),
            defaultTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            weekendTextStyle: TextStyle(color: Colors.red),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 18.0),
            titleCentered: true, // 제목 가운데 정렬
            formatButtonVisible: false, // 월/주/일 버튼 숨기기
          ),
        ),
      ),
    );
  }
}
