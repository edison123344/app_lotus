// ignore_for_file: file_names

import 'package:app_lotus/src/pages/actividad/SubActividad.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:app_lotus/src/pages/menu/Menu.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

//pantalla de seleccion de la hora de la actividad
// debugShowCheckedModeBanner: false,
// ignore: must_be_immutable
class SeleccionClendario extends StatefulWidget {
  SeleccionClendario(
      this.titulo, this.actividad, this.emocion_id, this.actividad_Id,
      {Key? key})
      : super(key: key);
  String titulo;
  String actividad;
  // ignore: non_constant_identifier_names
  String emocion_id;
  // ignore: non_constant_identifier_names
  String actividad_Id;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SeleccionClendario> {
  TextEditingController timeinputI = TextEditingController();
  TextEditingController timeinputf = TextEditingController();

  @override
  void initState() {
    timeinputI.text = "";
    timeinputf.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String horaIncio = '';
    String horaFin = '';
    return Scaffold(
      backgroundColor: appColors.body,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.actividad,
            style: const TextStyle(
              color: appColors.appbar,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _timeWidget(
                'Inicio',
                timeinputI.text,
                IconButton(
                  icon: const Icon(
                    Icons.power_settings_new_outlined,
                    size: 25.0,
                    color: appColors.text,
                  ),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      hourLabelText: 'Horas',
                      minuteLabelText: 'Minutos',
                      initialTime: TimeOfDay.now(),
                      context: context,
                      initialEntryMode: TimePickerEntryMode.input,
                      confirmText: "CONFIRMAR",
                      cancelText: "CANCELAR",
                      helpText: "HORA DE INICIO",
                    );

                    if (pickedTime != null) {
                      //print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          // ignore: use_build_context_synchronously
                          .parse(pickedTime.format(context).toString());

                      // print(parsedTime); //output 1970-01-01 22:53:00.000
                      horaIncio = DateFormat('HH:mm').format(parsedTime);
                      //print(horaIncio); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinputI.text =
                            horaIncio; //set the value of text field.
                      });
                    } else {
                      //print("no");
                    }
                  },
                ),
              ),
              _timeWidget(
                'Fin',
                timeinputf.text,
                IconButton(
                  // highlightColor: Color.fromARGB(255, 14, 14, 13),
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    size: 25.0,
                    color: appColors.text,
                  ),
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                      initialEntryMode: TimePickerEntryMode.input,
                      confirmText: "CONFIRMAR",
                      cancelText: "CANCELAR",
                      helpText: "HORA DE FIN",
                      hourLabelText: 'Horas',
                      minuteLabelText: 'Minutos',
                    );

                    if (pickedTime != null) {
                      // print(pickedTime.format(context)); //output 10:51 PM
                      DateTime parsedTime = DateFormat.jm()
                          // ignore: use_build_context_synchronously
                          .parse(pickedTime.format(context).toString());

                      //print(parsedTime); //output 1970-01-01 22:53:00.000
                      horaFin = DateFormat('HH:mm').format(parsedTime);
                      // print(horaFin); //output 14:59:00
                      //DateFormat() is from intl package, you can format the time on any pattern you need.

                      setState(() {
                        timeinputf.text =
                            horaFin; //set the value of text field.
                      });
                    } else {
                      //print("No se selecciono");
                    }
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                          builder: (context) => Menu(
                                selected: 1,
                                estado: true,
                                idSentimiento: widget.emocion_id,
                              )));
                },
                child: const Text('Cancelar'),
              ),
              const SizedBox(
                width: 20,
                height: 100,
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
                  //print(widget.titulo);
                  //print(widget.actividad);
                  //print('horas');
                  //print(horaFin);
                  //print(horaIncio);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Recomendacion(widget.emocion_id,
                              widget.actividad_Id, widget.titulo)));
                },
                child: const Text('Aceptar'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _timeWidget(String title, String time, IconButton icon) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        color: appColors.appbar,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                color: appColors.botton,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                color: appColors.body,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            icon,
          ],
        ),
      ),
    );
  }
}
