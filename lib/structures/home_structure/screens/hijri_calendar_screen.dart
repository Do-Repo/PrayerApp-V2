import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:new_prayer_app/enums.dart';
import 'package:new_prayer_app/widgets/add_event_dialog.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';
import 'package:new_prayer_app/widgets/pro_badge.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, this.fromHome});

  /// Screen opened from home screen, if true, it will hide bottom border of the appbar in calendar
  final bool? fromHome;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();

  var _calendarFormat = CalendarFormat.month;
  var calendarTypes = {CalendarType.Gregorian, CalendarType.Hijri};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(context, title: "Calendar", hideBorder: widget.fromHome),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.calendar_month)),
              const SizedBox(width: 5),
              const IconButton.outlined(onPressed: null, icon: Icon(Icons.edit_outlined)),
              const SizedBox(width: 5),
              const IconButton.outlined(onPressed: null, icon: Icon(Icons.delete_outline)),
              const SizedBox(width: 5),
              const ProBadge(child: IconButton.outlined(onPressed: null, icon: Icon(Icons.notification_add_outlined)))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
                context: context, isScrollControlled: true, useSafeArea: true, builder: (_) => AddEventDialog());
          },
          backgroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, strokeAlign: BorderSide.strokeAlignOutside, color: Colors.black38),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        body: SingleChildScrollView(
          child: TableCalendar(
            pageJumpingEnabled: true,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) => setState(() {
              _calendarFormat = format;
            }),
            focusedDay: _focusedDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = selectedDay;
              });
            },
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2050, 1, 1),
            headerStyle: const HeaderStyle(formatButtonShowsNext: false),
            calendarBuilders: CalendarBuilders(
              headerTitleBuilder: (context, day) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMM().format(day),
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      HijriCalendar.fromDate(day).toFormat("MMMM yyyy").toString(),
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.d().format(day),
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      HijriCalendar.fromDate(day).toFormat("d"),
                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Container(
                  color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.d().format(day),
                        style: const TextStyle(fontSize: 13),
                      ),
                      Text(
                        HijriCalendar.fromDate(day).toFormat("d"),
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
