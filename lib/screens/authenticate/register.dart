import 'package:flutter/material.dart';
import 'package:qrok/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  // Constructor for allowing parameters in ToggleView Function in register()
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Constants to use Firestore Auth Services
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Registrate en qrOK!'),
        // centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
            ),
            label: Text('Ya tengo \n  cuenta'),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10.0),
              TextFormField(
                // validator: (val) => val.isEmpty ? 'Ingresa un correo' : null,
                validator: (val) =>
                    EmailValidator.validate(email) ? null : "Correo Invalido",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Correo Electronico'),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: (val) => val.length < 6
                    ? 'Ingresa una clave con mas de 6 digitos'
                    : null,
                decoration: InputDecoration(labelText: 'Contraseña'),
                textInputAction: TextInputAction.next,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    // print(email);
                    // print(password);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() =>
                          error = 'Error de registro. Intente nuevamente');
                    }
                  }
                },
              ),
              SizedBox(height: 15.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
