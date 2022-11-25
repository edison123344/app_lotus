// ignore_for_file: file_names

import 'package:app_lotus/src/pages/actividad/SubActividad.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Actividad extends StatefulWidget {
  Actividad(this.idSentimiento, {Key? key}) : super(key: key);
  static String id = 'Actividad';
  String idSentimiento;
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class Choice {
  const Choice(
      // ignore: non_constant_identifier_names
      {required this.id_emocion,
      // ignore: non_constant_identifier_names
      required this.id_actividad,
      required this.title,
      required this.icon});
  // ignore: non_constant_identifier_names
  final String id_emocion;
  // ignore: non_constant_identifier_names
  final String id_actividad;
  final String title;
  final IconData icon;
}

//lista de actividades
const List<Choice> choices = <Choice>[
  Choice(
      id_emocion: "1",
      id_actividad: "1",
      title: '\nHacer actividades con tus seres queridos',
      icon: Icons.home),
  Choice(
      id_emocion: "1",
      id_actividad: "2",
      title: '\n Hacer ejercicio',
      icon: Icons.contacts),
  Choice(
      id_emocion: "2",
      id_actividad: "3",
      title: '\nActividades al aire libre',
      icon: Icons.map),
  Choice(
      id_emocion: "3",
      id_actividad: "4",
      title: '\nAfirmaciones con afecto',
      icon: Icons.phone),
  Choice(
      id_emocion: "4",
      id_actividad: "5",
      title: '\nArte (forma de conectarnos con emociones positivas)',
      icon: Icons.call_merge),
  Choice(
      id_emocion: "4",
      id_actividad: "6",
      title: '\nHigiene del sueño',
      icon: Icons.photo_album),
  Choice(
      id_emocion: "5",
      id_actividad: "7",
      title: '\nMantener el contacto con personas de tu círculo social',
      icon: Icons.accessibility),
];

class _HomePageState extends State<Actividad> {
  @override
  Widget build(BuildContext context) {
    // print(widget.idSentimiento);

    return Scaffold(
      backgroundColor: appColors.body,
      body: GridView.count(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 4,
        children: List.generate(
          choices.length,
          (index) {
            //print('lista');
            //print(choices[index].id_emocion);
            if (widget.idSentimiento == choices[index].id_emocion) {
              return Center(
                child: SelectCard(choice: choices[index]),
              );
            } else {
              ///index - 1;
              //choices.(index);
              return const Center();
            }
          },
        ),
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Recomendacion(
                    choice.id_emocion, choice.id_actividad, choice.title)));
      },
      child: Card(
        color: appColors.botton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        //contenedor de la lista de actividades
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          height: 200,
          width: 350,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Icon(choice.icon, size: 30, color: appColors.text),
              SizedBox(
                width: 300,
                height: 50,
                child: AutoSizeText(
                  textAlign: TextAlign.center,
                  choice.title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: appColors.text,
                  ),
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
