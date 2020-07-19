import 'package:flutter/material.dart';
import 'package:qrok/models/users.dart';
import 'package:qrok/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:qrok/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return Authenticate();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
