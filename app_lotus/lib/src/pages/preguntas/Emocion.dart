// ignore_for_file: import_of_legacy_library_into_null_safe, file_names, prefer_const_constructors
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_lotus/src/pages/menu/Menu.dart';

//patalla de emociones
// ignore: must_be_immutable
class Activity2Page extends StatelessWidget {
  String actividad;
  Activity2Page(this.actividad, {Key? key}) : super(key: key);

  static const String id = 'Activity2Page';
  @override
  Widget build(BuildContext context) {
    //agregar();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.appbar,
        // title: Text(this.actividad),
      ),
      backgroundColor: appColors.body,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Hoy me senti $actividad",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: appColors.text,
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ]),
          Row(
            //platilla de emociones
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/emojis/increible.png',
                ),
                iconSize: 60,
                highlightColor: Color.fromARGB(255, 249, 252, 117),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(
                              selected: 2, estado: true, idSentimiento: '1')));
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/emojis/bien.png',
                ),
                iconSize: 60,
                highlightColor: Color.fromARGB(255, 117, 252, 151),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(
                              selected: 2, estado: true, idSentimiento: '2')));
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/emojis/meh.png',
                ),
                iconSize: 60,
                highlightColor: Color.fromARGB(255, 109, 194, 60),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(
                              selected: 2, estado: true, idSentimiento: '3')));
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/emojis/mal.png',
                ),
                iconSize: 60,
                highlightColor: Color.fromARGB(255, 163, 60, 194),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(
                              selected: 2, estado: true, idSentimiento: '4')));
                },
              ),
              IconButton(
                icon: Image.asset(
                  'assets/emojis/triste.png',
                ),
                iconSize: 60,
                highlightColor: Color.fromARGB(255, 60, 134, 194),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Menu(
                              selected: 2, estado: true, idSentimiento: '5')));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
