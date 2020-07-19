import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrok/models/users.dart';
import 'package:qrok/screens/wrapper.dart';
import 'package:qrok/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
