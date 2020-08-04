// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrok/models/brew.dart';
import 'package:qrok/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:qrok/services/database.dart';
import 'package:qrok/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido a qrOK!'),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text('Salir'),
              textColor: Colors.white,
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
