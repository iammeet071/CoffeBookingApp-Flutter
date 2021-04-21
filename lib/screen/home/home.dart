import 'package:fire1/models/brew.dart';
import 'package:fire1/screen/home/brew_list.dart';
import 'package:fire1/screen/home/settings_form.dart';
import 'package:fire1/services/auth.dart';
import 'package:fire1/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('mcCafe'),
          backgroundColor: Colors.pink[900],
          elevation: 0,
          actions: <Widget>[
            TextButton.icon(
              label: Text(
                'LogOut',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
                final snackBar = SnackBar(
                  content: Text('LogOut Succesfull !',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.pink[900],
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            Container(
              child: TextButton.icon(
                onPressed: () {
                  return _showSettingPanel();
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                label: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
