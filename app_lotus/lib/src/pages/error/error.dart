import 'package:flutter/material.dart';

import 'package:app_lotus/src/pages/inicio/Registro.dart';

//pantalla de error
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);
  static const String id = 'ErrorPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: const Color(0xFFA5D6A7),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          const Expanded(
            child: SizedBox(),
          ),
          FloatingActionButton(
            heroTag: 'btnS',
            child: const Text('about'),
            onPressed: () {
              //Navigator.pushNamed(context, '/home');

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Registro()));
            },
          ),
        ],
      ),
    );
  }
}
