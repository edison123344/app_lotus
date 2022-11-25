// ignore: file_names
import 'package:app_lotus/src/pages/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'Advertencia_2.dart';

//patallla de registro
class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);
  static const String id = 'Registro';
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Registro> {
  File? _image;

  final _picker = ImagePicker();
  // implementacion de la imagen
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appColors.body,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(70), // Image radius
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 187, 185, 185),
                                shape: BoxShape.circle),
                            width: 150,
                            height: 150,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: appColors.text,
                      backgroundColor: appColors.botton,
                      minimumSize: const Size(160, 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      _openImagePicker();
                    },
                    child: const Text('Cargar imagen'),
                  ),
                ),
                const SizedBox(height: 10),
                const MyCustomForm(),
              ]),
            ]));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //seccion de la introducciondel texto
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nickname *',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingrese Nickname';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Correo(Opcional)',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
              //botones de cancelar y aceptar
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => exit(0)));
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WarningPage()));
                    }
                  },
                  child: const Text('Aceptar'),
                ),
              ])
        ],
      ),
    );
  }
}
