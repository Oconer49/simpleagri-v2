import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/button_pill.dart';

class Dialogo {


  void showAlert(content, String texto) {

    showDialog(
        context: content,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          scrollable: true,
          title:  Text( "Alerta" ),
          content: Text( texto),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextoBoton(
                text: "Aceptar",
                textColor: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      );
  }

}