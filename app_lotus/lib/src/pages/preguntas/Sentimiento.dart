// ignore_for_file: import_of_legacy_library_into_null_safe, file_names
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app_lotus/src/pages/Preguntas/Emocion.dart';

//patalla de sentimiento
// ignore: must_be_immutable
class Activity1Page extends StatelessWidget {
  static const String id = 'Activity1Page';
  String activ = '';

  Activity1Page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: const Text('Services'),
      //),
      backgroundColor: appColors.body,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Hoy como me senti ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: appColors.text,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ]),
          Row(
            //analisis del sentimiento en los distintos estados
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.hail,
                  color: appColors.text,
                  size: 50,
                ),
                label: const Text("En el trabajo"),
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  //onPrimary: Colors.white,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  activ = 'en el trabajo';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Activity2Page(activ)));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.account_balance,
                  color: appColors.text,
                  size: 50,
                ),
                label: const Text("En la universidad"),
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  activ = 'en la universidad';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Activity2Page(activ)));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.family_restroom,
                  color: appColors.text,
                  size: 50,
                ),
                label: const Text("Con tu Familia"),
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  activ = 'con mi Familia';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Activity2Page(activ)));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.groups,
                  color: appColors.text,
                  size: 50,
                ),
                label: const Text("Con tus amigos"),
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  activ = 'con mis amigos';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Activity2Page(activ)));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.people_rounded,
                  color: appColors.text,
                  size: 50,
                ),
                label: const Text("Con tu pareja"),
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  activ = 'con mi pareja';
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Activity2Page(activ)));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
