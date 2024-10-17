import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/conexion/servicio.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/button_pill.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/header.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  bool loading = true, showHistory = false;
  late String system, user, dateDownload;
  int historyCount = 0;
  String history = '';


  @override
  void initState() {
    Timer(  Duration(seconds: 3), () => { precarga() } );
    super.initState();
  }

  Future<void> precarga() async {
    loading=false;
    setState(() {});
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Header(
          text: 'Simple Agri',
          back: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      drawer: Menu(),
      body: loading == true
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
              Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.lightGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "222",//S.of(context).L0050,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                ButtonPill(
                  text: 'Desarrollo',
                  onPressed: () async {
                    //realizar la logica de la pantalla 
                    //ejemplo de llamar un widget
                    //Navigator.of(context).pushNamed('/');

                    //cuando cree el widget nuevo tendran que realizar la clase de tabla 
                   // https://api.flutter.dev/flutter/widgets/Table-class.html
                  },
                ),


              ],
            ),
    );
  }
}