import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/conexion/servicio.dart';
import 'package:intl/intl.dart';

class ControladorTerrenos {

  CallService controlador = CallService();
  //aqui agregar logica para cargue de la tabla y la busqueda de datos
  
  Future listadoTabla({required BuildContext context, }) async {

    //esta es la forma de invocar un servicio 
    //te devolvera una lista con los parametros mencionado en el documento 
    //ya los tinenes que manipular
    var dd = await controlador.callMethod( "PruebaTecnica","obtener_terrenos", Map() );



    
  }

  Future consultar({required BuildContext context, required String nombre, required String codigo }) async {
    
    //aqui es la consulta

    //parametro para enviar al servidor
    Map parametros = {
      "nombre": nombre,
      "codigo": codigo
    };

    //aqui devuelve una lista con los datos buscados
    var ee = await controlador.callMethod( "PruebaTecnica","cultar_terrenos", parametros );



  }

}
