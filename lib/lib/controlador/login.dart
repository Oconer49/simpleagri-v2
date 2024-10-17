import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/conexion/authentication.dart';
import 'package:flutter_simpleagri_prueba/lib/controlador/shared_preferences.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/Dialogo.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/button_pill.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ControladorLogin {


  Future verificacionUsuario({required BuildContext context,required String usuario, required String password }) async {

    try {

      final data = await Authentication().login( usuario, password);
      
      data.split('; ').asMap().forEach((index, item) {

        if (item.indexOf('=') > -1) {
            final key = item.split('=')[0];
            final value = item.split('=')[1];
            if (key == 'sess') {
              String sess = value;
              sess = sess!.replaceAll('; path', '');
              Preferences.prefs_authentication = sess;
            }
            if (key.indexOf('user') > -1) {
              String userDb = value.replaceAll('; path', '');
                  //userDb = utf8.decode(base64Url.decode(userDb));
            }
            if (key.indexOf('full_name') > -1) {
              String fullName = value.replaceAll('+', ' ');
              fullName = fullName!.replaceAll('; path', '');
            }
        }
      });
      return true;

    } catch (exception) {
      Dialogo().showAlert( context, exception.toString().substring(11));
      return false;
    }

  }


}