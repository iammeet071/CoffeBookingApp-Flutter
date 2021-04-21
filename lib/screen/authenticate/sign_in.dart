import 'package:fire1/screen/authenticate/register.dart';
import 'package:fire1/shared/constants.dart';
import 'package:fire1/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fire1/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Sign In',
              ),
              backgroundColor: Colors.pink[900],
              elevation: 0,
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              // child:  ElevatedButton(
              //   child: Text('Sign In'),
              //   onPressed: () async {
              //     dynamic result = await _auth.signInAnon();

              //     if (result == null) {
              //       print('error signin');
              //     } else {
              //       print('signin succesfull');
              //       print(result.uid);
              //       final snackBar = SnackBar(
              //         content: Text('LogIn Succesfull !!',
              //             style: TextStyle(
              //                 color: Colors.black, fontWeight: FontWeight.bold)),
              //         backgroundColor: Colors.pink[900],
              //       );
              //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //     }
              //   },
              // ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        new Icon(Icons.email),
                        SizedBox(
                          width: 20,
                        ),
                        new Container(
                          child: new Flexible(
                            child: new TextFormField(
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Enter an Email.' : null,
                                onChanged: (val) {
                                  setState(() {
                                    return email = val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        new Icon(
                          Icons.vpn_key,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        new Container(
                          child: new Flexible(
                            child: new TextFormField(
                                decoration: textInputDecoration,
                                validator: (val) => val.length < 8
                                    ? 'Password should be aleast 8 chars long.'
                                    : null,
                                obscureText: true,
                                onChanged: (val) {
                                  setState(() {
                                    return password = val;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.pink[400]),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              return loading = true;
                            });
                            dynamic result = await _auth
                                .signInWithEmailAndPasword(email, password);
                            if (result == null) {
                              setState(() {
                                return error = 'Enter Valid Credentials. !!';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.white,
          );
  }
}
