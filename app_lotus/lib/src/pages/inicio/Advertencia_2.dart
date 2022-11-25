// ignore_for_file: import_of_legacy_library_into_null_safe, file_names

import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:app_lotus/src/pages/inicio/Advertencia.dart';
import 'package:flutter/material.dart';

//pantalla de la segunda advertencio
class WarningPage extends StatelessWidget {
  const WarningPage({Key? key}) : super(key: key);
  static const String id = 'WarningPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.body,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.info_rounded, size: 220, color: Colors.red),
                SizedBox(
                  height: 15,
                ),
                //texto de advertencia
                Text(
                  "La siguiente aplicación es solo de ayuda emocional, no sustituye la necesidad de asistir a consulta médica, no olvides de visitar a tu médico",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
              ]),
          Row(
            //botones de cancelar y Aceptar
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(160, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  //print('Pressed');
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: appColors.text,
                  backgroundColor: appColors.botton,
                  minimumSize: const Size(160, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecommendationPage()));
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
