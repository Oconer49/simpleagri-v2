import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/controlador/terrenos.dart';

class TerrenosPage extends StatefulWidget {
  @override
  _TerrenosPageState createState() => _TerrenosPageState();
}

class _TerrenosPageState extends State<TerrenosPage> {
  final ControladorTerrenos controlador = ControladorTerrenos(); // Instancia del controlador
  final TextEditingController _searchNameController = TextEditingController(); // Controlador para nombre.
  final TextEditingController _searchCodeController = TextEditingController(); // Controlador del código.
  List<dynamic> _results = [];

  // Método para convertir el estado de un terreno de código numérico a una cadena legible.
  String statusToString(String status) {
    switch (status) {
      case '0':
        return 'Activo';
      case '1':
        return 'Inactivo';
      case '2':
        return 'Cerrado';
      default:
        return 'Desconocido';
    }
  }

  // Método para realizar la búsqueda de terrenos según los parámetros ingresados.
  Future<void> _search() async {
    String nombre = _searchNameController.text;
    String codigo = _searchCodeController.text; 
    
    // Si alguno de los campos no está vacío, realiza la consulta.
    if (nombre.isNotEmpty || codigo.isNotEmpty) {
      List<dynamic> data = await controlador.consultar(
          context: context, nombre: nombre, codigo: codigo);
      
      setState(() {
        _results = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Búsqueda de Terrenos'), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          children: [
            TextField(
              controller: _searchNameController,
              decoration: InputDecoration(
                labelText: 'Buscar por Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20), // Espacio entre el campo de nombre y el siguiente.
            TextField(
              controller: _searchCodeController, // Asigna el controlador del campo de búsqueda por código.
              decoration: InputDecoration(
                labelText: 'Buscar por Código', 
                border: OutlineInputBorder(), 
              ),
            ),
            SizedBox(height: 20), // Espacio entre el campo de código y el botón de búsqueda.
            ElevatedButton(
              onPressed: _search,
              child: Text('Buscar'),
            ),
            SizedBox(height: 20), // Espacio entre el botón de búsqueda y los resultados.
            Expanded(
              // Si no hay resultados, muestra un mensaje, de lo contrario, despliega los resultados en una tabla.
              child: _results.isEmpty
                  ? Center(child: Text('No hay resultados'))
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Table(
                        border: TableBorder.all(),
                        columnWidths: const <int, TableColumnWidth>{
                          0: FlexColumnWidth(44), 
                          1: FixedColumnWidth(67), 
                          2: FixedColumnWidth(76), 
                          3: FixedColumnWidth(70),
                        },
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle, 
                        children: [

                          TableRow(
                            decoration: BoxDecoration(color: Colors.grey[300]), 
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Terreno', style: TextStyle(fontWeight: FontWeight.bold)), // Encabezado de la columna 'Terreno'.
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Código', style: TextStyle(fontWeight: FontWeight.bold)), // Encabezado de la columna 'Código'.
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Fecha', style: TextStyle(fontWeight: FontWeight.bold)), // Encabezado de la columna 'Fecha'.
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Estado', style: TextStyle(fontWeight: FontWeight.bold)), // Encabezado de la columna 'Estado'.
                              ),
                            ],
                          ),
                          // Genera una fila por cada resultado de la búsqueda.
                          ..._results.map((item) {
                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item['terrain'] ?? 'N/A'), // Muestra el nombre del terreno.
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item['crop'] ?? 'N/A'), // Muestra el código del terreno.
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(item['creation_stamp'] ?? 'N/A'), // Muestra la fecha de creación del terreno.
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(statusToString(item['status'])), // Convierte y muestra el estado del terreno.
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}