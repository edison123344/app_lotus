import 'package:app_lotus/src/pages/calendario/Agenda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' show DateFormat;

//patalla del calendario de emociones
// ignore: must_be_immutable
class CalendarPr extends StatefulWidget {
  CalendarPr(this.id_icono, {Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  String id_icono;
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class Choice {
  const Choice({required this.id, required this.date, required this.icon});
  final String id;
  final DateTime date;
  final IconData icon;
}

class _MyHomePageState extends State<CalendarPr> {
  //DateTime _currentDate = DateTime(2019, 2, 3);

  DateTime _currentDate2 = DateTime.now();
  String _currentMonth = DateFormat.yMMM('es').format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  final EventList<Event> _markedDateMap = EventList<Event>(
    events: {},
  );
  //lista de emociones
  List<Choice> choices = <Choice>[
    Choice(id: "1", date: DateTime(2022, 10, 2), icon: Icons.tag_faces),
    Choice(id: "2", date: DateTime(2022, 10, 7), icon: Icons.mood_bad),
    Choice(id: "3", date: DateTime(2022, 10, 8), icon: Icons.tag_faces),
  ];
  void agregar() {
    // ignore: non_constant_identifier_names
    DateTime Date = DateTime.now();
    if (widget.id_icono == '1') {
      choices.add(Choice(
          id: '1',
          date: DateTime(Date.year, Date.month, Date.day),
          icon: Icons.tag_faces));
    }
    if (widget.id_icono == '2') {
      choices.add(Choice(
          id: '2',
          date: DateTime(Date.year, Date.month, Date.day),
          icon: Icons.sentiment_satisfied_alt));
    }
    if (widget.id_icono == '3') {
      choices.add(Choice(
          id: '3',
          date: DateTime(Date.year, Date.month, Date.day),
          icon: Icons.sentiment_satisfied));
    }
    if (widget.id_icono == '4') {
      choices.add(Choice(
          id: '4',
          date: DateTime(Date.year, Date.month, Date.day),
          icon: Icons.mood_bad));
    }
    if (widget.id_icono == '5') {
      choices.add(Choice(
          id: '5',
          date: DateTime(Date.year, Date.month, Date.day),
          icon: Icons.sentiment_dissatisfied_outlined));
    }
  }

  @override
  void initState() {
    agregar();

    /// Add more events to _markedDateMap EventList
    var len = choices.length;
    for (int i = 0; i < len; i++) {
      _markedDateMap.addAll(choices[i].date, [
        Event(
          date: choices[i].date,
          title: 'Event 1',
          icon: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(1000)),
            ),
            child: Icon(
              choices[i].icon,
              color: Colors.amber,
            ),
          ),
        ),
      ]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (date, events) {
        setState(() => _currentDate2 = date);
        // events.forEach((event) => print(event.title));
        //print('pressed date $date');
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      locale: 'ES',
      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 75, 255, 59))),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: const TextStyle(
        color: Colors.blue,
      ),
      //showIconBehindDayText: true,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      markedDateMoreShowTotal: true,
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: const TextStyle(
        color: Colors.yellow,
      ),

      prevDaysTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM('es').format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        // print('long pressed date $date');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const claendarSe()));
      },
    );

    return Scaffold(
        backgroundColor: appColors.body,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                      child: Text(
                    _currentMonth,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )),
                  IconButton(
                    //iconSize: 100,
                    icon: const Icon(
                      Icons.navigate_before,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month - 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        },
                      );
                    },
                  ),
                  IconButton(
                    //iconSize: 100,
                    icon: const Icon(
                      Icons.navigate_next,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          _targetDateTime = DateTime(
                              _targetDateTime.year, _targetDateTime.month + 1);
                          _currentMonth =
                              DateFormat.yMMM().format(_targetDateTime);
                        },
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: calendarCarouselNoHeader,
              ), //
            ],
          ),
        ));
  }
}
