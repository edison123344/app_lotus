// ignore_for_file: import_of_legacy_library_into_null_safe, file_names
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'Encuesta.dart';

//pantalla de advertencia
class RecommendationPage extends StatelessWidget {
  const RecommendationPage({Key? key}) : super(key: key);
  static const String id = 'RecommendationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.body,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //nota de advertencia
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.hiking,
                    size: 220, color: Color.fromARGB(255, 10, 51, 231)),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "No olvides mantener el contacto con personas de tu círculo social, Llamar a tus amigos, Hacer videochats grupales, Hacer dinámicas online, juegos o películas.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
              ]),
          Row(
              //Botones de continuar y cancelar
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
                            builder: (context) => const Sentimiento()));
                  },
                  child: const Text('Aceptar'),
                ),
              ]),
        ],
      ),
    );
  }
}
