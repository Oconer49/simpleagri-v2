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
  bool loading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => precarga());
  }

  Future<void> precarga() async {
    // Simulación de carga de datos
    await Future.delayed(Duration(seconds: 1)); 
    setState(() {
      loading = false;
    });
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
      body: loading
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
                      "Bienvenido",
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
                  onPressed: () {
                  },
                ),
                SizedBox(height: 10),
                // Botón para Búsqueda de Terrenos
                ButtonPill(
                  text: 'Búsqueda de Terrenos',
                  onPressed: () {
                    Navigator.pushNamed(context, '/terrenos');
                  },
                ),
              ],
            ),
    );
  }
}