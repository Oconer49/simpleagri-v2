import 'package:flutter/material.dart';
import 'package:flutter_simpleagri_prueba/lib/conexion/authentication.dart';
import 'package:flutter_simpleagri_prueba/lib/conexion/verify_connectivity.dart';
import 'package:flutter_simpleagri_prueba/lib/controlador/login.dart';
import 'package:flutter_simpleagri_prueba/lib/controlador/shared_preferences.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/button_pill.dart';
import 'package:flutter_simpleagri_prueba/lib/widgets/Dialogo.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  ControladorLogin controlador = ControladorLogin();

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Image.asset(
            'images/logoSA.png',
            width: 200,
          ),
          input("Ingrese Usuario1", "Usuario", false, controllerUser),
          const SizedBox(height: 20),
          input("Ingrese Contraseña" , "Contraseña", true, controllerPassword),
          const SizedBox(height: 40),
          ButtonPill(text: "Ingresar",
            onPressed: () {
              go(context);
            },
          ),
          const SizedBox(height: 140),
          /*FutureBuilder(
            future: queryStore.getSystem(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                return Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse(
                      "https://${snapshot.data}.${Preferences.prefs_http_host}/forgot.html"),
                  builder: (context, followLink) => ButtonPillSecondary(
                    text: S.of(context).APP0000581,
                    onPressed: () {
                      dialog.confirm(context, S.of(context).APP0000582, () {
                        followLink!();
                      });
                    },
                  ),
                );
              }
            },
          ),
          ButtonPillSecondary(
            text: S.of(context).T0327,
            onPressed: () {
              Navigator.of(context).pushNamed('/system');
            },
          ),*/
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Versión App: 1.0.1"),
            ],
          ),
        ],
      ),
    );
  }

  Widget input(String hintText, String labelText, bool pwd,
      TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText: pwd ? _obscureText : false,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        hintText: hintText,
        suffix: pwd
            ? GestureDetector(
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      onFieldSubmitted: (value) => go(context),
    );
  }

  Future<void> go(context) async {
   // _loading.show(context);
    final String user = controllerUser.text.trim();
    final String password = controllerPassword.text.trim();
    if (user.isEmpty) {
      controllerUser.clear();
      Dialogo().showAlert(context,"Por favor ingrese un usuario");
    } else if (password.isEmpty) {
      controllerPassword.clear();
      Dialogo().showAlert(context,"Por favor ingrese su contraseña");
    } else {
      if (await VerifyConnectivity().netPing() == true) {
      //  try {

          var result = await controlador.verificacionUsuario(context: context, usuario: user, password: password);

          var ffdf = "";

          if( result ){
            Navigator.of(context).pushNamed('/menu');
          }

          
/*
          if (Preferences.prefs_opciones == 1) {

            data.split('; ').asMap().forEach((index, item) {
              if (item.indexOf('=') > -1) {
                final key = item.split('=')[0];
                final value = item.split('=')[1];
                if (key == 'sess') {
                  sess = value;
                  sess = sess!.replaceAll('; path', '');
                }
                if (key.indexOf('user') > -1) {
                  userDb = value.replaceAll('; path', '');
                  //userDb = utf8.decode(base64Url.decode(userDb));
                }
                if (key.indexOf('full_name') > -1) {
                  fullName = value.replaceAll('+', ' ');
                  fullName = fullName!.replaceAll('; path', '');
                }
              }
            });
          } else if (Preferences.prefs_opciones == 2) {
            List registro = data;
            registro.asMap().forEach((index, item) {
              if (item.indexOf('=') > -1) {
                final key = item.split('=')[0];
                final value = item.split('=')[1];
                if (key == 'sess') {
                  sess = value;
                  sess = sess!.replaceAll('; path', '');
                }
                if (key.indexOf('user') > -1) {
                  userDb = value.replaceAll('; path', '');
                  //userDb = utf8.decode(base64Url.decode(userDb));
                }
                if (key.indexOf('full_name') > -1) {
                  fullName = value.replaceAll('+', ' ');
                  fullName = fullName!.replaceAll('; path', '');
                }
              }
            });
          }
          await queryStore.setSess(userDb, sess, fullName);
          Navigator.of(context).pushNamed('/download');*/


    //    } catch (exception) {
   //       showAlert(exception.toString().substring(11));
    //    }

      } else {
        Dialogo().showAlert(context,"Sin conexión a internet!");
      }
    }
  }


}