import 'package:flutter/material.dart';
import 'package:app_lotus/src/pages/error/error.dart';
import 'package:app_lotus/src/pages/inicio/Registro.dart';
import 'package:app_lotus/src/pages/inicio/Advertencia_2.dart';
import 'package:app_lotus/src/pages/inicio/Encuesta.dart';
import 'package:app_lotus/src/pages/inicio/Advertencia.dart';
import 'package:app_lotus/src/pages/Preguntas/Emocion.dart';
import 'package:app_lotus/src/pages/Preguntas/Sentimiento.dart';
import 'package:app_lotus/src/pages/menu/Menu.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    return MaterialApp(
      initialRoute: Registro.id,
      routes: <String, WidgetBuilder>{
        Registro.id: (context) => const Registro(),
        WarningPage.id: (context) => const WarningPage(),
        RecommendationPage.id: (context) => const RecommendationPage(),
        Sentimiento.id: (context) => const Sentimiento(),
        Activity1Page.id: (context) => Activity1Page(),
        Activity2Page.id: (context) => Activity2Page(''),
        Menu.id: (context) =>
            Menu(selected: 0, estado: false, idSentimiento: ''),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (builder) => const ErrorPage());
      },
    );
  }
}
