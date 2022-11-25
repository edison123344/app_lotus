// ignore_for_file: file_names

import 'package:app_lotus/src/pages/calendario/SeletorHora.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:app_lotus/src/pages/menu/Menu.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class Recomendacion extends StatefulWidget {
  Recomendacion(this.Id_emocion, this.actividad_Id, this.titulo, {Key? key})
      : super(key: key);
  static const String id = 'Actividad';
  // ignore: non_constant_identifier_names
  String Id_emocion;
  // ignore: non_constant_identifier_names
  String actividad_Id;
  String titulo;
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Recomendacion> {
  List<Map> activ = [
    {"actividad_Id": "1", "subtitle": "\nVer una película"},
    {"actividad_Id": "1", "subtitle": "\nSalir a comer"},
    {"actividad_Id": "1", "subtitle": "\nIr de compras"},
    {"actividad_Id": "1", "subtitle": "\nSalir de viaje"},
    {"actividad_Id": "1", "subtitle": "\nCocinar "},
    {"actividad_Id": "2", "subtitle": "\nInscribirte en un gimnasio "},
    {"actividad_Id": "2", "subtitle": "\nHacer rutinas en tu casa"},
    {"actividad_Id": "2", "subtitle": "\nPracticar algún deporte"},
    {"actividad_Id": "3", "subtitle": "\nSalir a trotar o caminar"},
    {
      "actividad_Id": "3",
      "subtitle":
          "\nSi tienes mascotas puedes sacarla a pasear y jugar con ella afuera"
    },
    {"actividad_Id": "3", "subtitle": "\nIr a un parque "},
    {"actividad_Id": "3", "subtitle": "\nJardinería "},
    {
      "actividad_Id": "4",
      "subtitle": "\nVístete con ropa que te haga sentir seguro/a"
    },
    {"actividad_Id": "4", "subtitle": "\nDate regalos que te hagan feliz"},
    {"actividad_Id": "4", "subtitle": "\nCuida tu higiene "},
    {"actividad_Id": "5", "subtitle": "\nDibujar"},
    {"actividad_Id": "5", "subtitle": "\nLeer"},
    {"actividad_Id": "5", "subtitle": "\nEscribir"},
    {"actividad_Id": "5", "subtitle": "\nActuar"},
    {"actividad_Id": "5", "subtitle": "\nBailar"},
    {
      "actividad_Id": "6",
      "subtitle": "\nDespertarse y acostarse a la misma hora"
    },
    {
      "actividad_Id": "6",
      "subtitle":
          "\nLimitar el tiempo diario en cama al tiempo necesario de sueño"
    },
    {
      "actividad_Id": "6",
      "subtitle": "\nSuprimir la ingesta de sustancias con efecto activador "
    },
    {"actividad_Id": "6", "subtitle": "\nEvitar siestas durante el día "},
    {
      "actividad_Id": "6",
      "subtitle":
          "\nEvitar actividades excitantes en las horas previas a acostarse (ejercicio- crossfit)"
    },
    {
      "actividad_Id": "6",
      "subtitle": "\nTomar baños de agua a temperatura corporal"
    },
    {
      "actividad_Id": "7",
      "subtitle":
          "\nLlamar a tus amigos, Hacer videochats grupales, Hacer dinámicas online – juegos- peliculas"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
          style: const TextStyle(
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
                    builder: (context) => Menu(
                          selected: 2,
                          estado: true,
                          idSentimiento: widget.Id_emocion,
                        )));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Menu(
                        selected: 2,
                        estado: true,
                        idSentimiento: widget.Id_emocion,
                      )));
        },
        icon: const Icon(Icons.local_activity),
        label: const Text("Nueva Actividad"),
        backgroundColor: appColors.appbar,
        foregroundColor: appColors.text,
      ),
      backgroundColor: appColors.body,
      body: ListTileTheme(
        contentPadding: const EdgeInsets.all(15),
        iconColor: appColors.text,
        textColor: appColors.text,
        tileColor: appColors.botton,
        style: ListTileStyle.list,
        dense: true,
        child: ListView.builder(
            itemCount: activ.length,
            itemBuilder: (BuildContext ctxt, int index) {
              if (widget.actividad_Id == activ[index]['actividad_Id']) {
                return Card(
                  color: appColors.botton,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      leading: const Icon(Icons.flight_land),
                      //subtitle: Text(activ[index]['subtitle']),
                      subtitle: AutoSizeText(
                        activ[index]['subtitle'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: appColors.text,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeleccionClendario(
                                    widget.titulo,
                                    activ[index]['subtitle'],
                                    widget.Id_emocion,
                                    activ[index]['actividad_Id'])));
                      },
                      trailing: const Icon(Icons.add_box)),
                );
              } else {
                return const SizedBox(
                  width: 0,
                  height: 0,
                );
              }
            }),
      ),
    );
  }
}
