// ignore_for_file: import_of_legacy_library_into_null_safe, file_names
import 'package:flutter/material.dart';
import 'package:app_lotus/src/pages/preguntas/Sentimiento.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';

//patalla de encuesta
class Sentimiento extends StatefulWidget {
  const Sentimiento({Key? key}) : super(key: key);
  static const String id = 'Sentimiento';
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Sentimiento> {
  // Genere una lista de las opciones a elegir de encuesta
  List<Map> activ = [
    {
      "name": "Te sientes desanimado /a, deprimido/a, o sin esperanza ",
      "isChecked": false
    },
    {"name": "Te has sentido triste", "isChecked": false},
    {
      "name": "Has pérdida el interés en actividades cotidianas ",
      "isChecked": false,
    },
    {"name": "Has tenido Trastornos del sueño", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.appbar,
        title: const Text(
          'Cuestionario',
          style: TextStyle(
            color: appColors.text,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      backgroundColor: appColors.body,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              //pregunta de la encuesta
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Porque te descargaste la aplicación :',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // The checkboxes will be here
            Column(
                children: activ.map((data) {
              return CheckboxListTile(
                  value: data["isChecked"],
                  title: Text(data["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      data["isChecked"] = newValue;
                    });
                  });
            }).toList()),

            // Display the result here
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Wrap(
              children: activ.map((data) {
                if (data["isChecked"] == true) {
                  return Card(
                    elevation: 3,
                    color: appColors.pale,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data["name"]),
                    ),
                  );
                }

                return Container();
              }).toList(),
            ),
            Row(
                //botones de aceptar y cancelar
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
                              builder: (context) => Activity1Page()));
                    },
                    child: const Text('Aceptar'),
                  ),
                ])
          ]),
        ),
      ),
    );
  }
}
