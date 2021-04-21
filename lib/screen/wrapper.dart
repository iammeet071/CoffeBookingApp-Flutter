import 'package:fire1/models/user.dart';
import 'package:fire1/screen/authenticate/authenticate.dart';
import 'package:fire1/screen/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user1 = Provider.of<NewUser>(context);
    print(user1);

    if (user1 == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
