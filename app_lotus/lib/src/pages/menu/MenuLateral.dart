import 'package:app_lotus/src/pages/Informacion/Perfil.dart';
import 'package:app_lotus/src/pages/Informacion/acerca_de.dart';
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';

//menu lateral
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('assets/Logo.jpeg'))),
            child: Text(
              '',
              style: TextStyle(color: appColors.text, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Perfil'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Perfil()))
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Calendario'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Menu(selected: 1, estado: true, idSentimiento: '1')))
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Resumen'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Menu(selected: 0, estado: true, idSentimiento: '1')))
            },
          ),
          ListTile(
            leading: const Icon(Icons.aod_sharp),
            title: const Text('Informacion'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Acerca()))
            },
          ),
        ],
      ),
    );
  }
}
