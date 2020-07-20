import 'package:flutter/material.dart';
import 'package:qrok/services/auth.dart';

class SignIn extends StatefulWidget {
  // Constructor for allowing parameters in ToggleView Function in register()
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Ingresa a qrOK!'),
        // centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
            ),
            label: Text('Registro'),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Correo Electronico'),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),

        // child: RaisedButton(
        //   child: Text('Ingreso anonimo'),
        //   onPressed: () async {
        //     dynamic result = await _auth.signInAnon();
        //     if (result == null) {
        //       print('Problema al ingresar');
        //     } else {
        //       print('Ingreso exitoso');
        //       print(result.uid);
        //     }
        //   },
        // ),
      ),
    );
  }
}
