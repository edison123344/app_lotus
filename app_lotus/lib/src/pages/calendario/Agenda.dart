// ignore_for_file: file_names
import 'package:app_lotus/src/pages/menu/Menu.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';

//Agenda de actividades
// ignore: camel_case_types
class claendarSe extends StatefulWidget {
  const claendarSe({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<claendarSe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Agenda de Actividades',
            style: TextStyle(
              color: appColors.text,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: appColors.appbar,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: appColors.text,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Menu(selected: 1, estado: true, idSentimiento: '1')));
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appColors.appbar,
          foregroundColor: appColors.text,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Menu(selected: 1, estado: true, idSentimiento: '1')));
          },
          child: const Icon(Icons.calendar_month),
        ),
        backgroundColor: appColors.body,
        body: Row(
          children: [
            Localizations.override(
              context: context,
              locale: const Locale('es'),
              child: SfCalendar(
                view: CalendarView.schedule,
                scheduleViewSettings: const ScheduleViewSettings(
                  appointmentItemHeight: 70,
                ),
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
              ),
            ),
          ],
        ));
  }

//lista creada para la agenda de actividades
  List<Meeting> _getDataSource() {
    final DateTime today = DateTime.now();
    final List<Meeting> meetings = <Meeting>[
      Meeting(
          'Actividades al aire libre',
          DateTime(today.year, today.month, today.day, 12),
          DateTime(today.year, today.month, today.day, 12)
              .add(const Duration(hours: 2)),
          const Color.fromARGB(255, 9, 82, 41),
          false),
      Meeting(
          'Afirmaciones con afecto',
          DateTime(today.year, today.month, today.day, 6),
          DateTime(today.year, today.month, today.day, 6)
              .add(const Duration(hours: 2)),
          const Color.fromARGB(255, 9, 82, 41),
          false),
    ];

    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting('Arte (forma de conectarnos con emociones positivas)', startTime,
          endTime, const Color(0xFF0F8644), false),
    );
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }
    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
