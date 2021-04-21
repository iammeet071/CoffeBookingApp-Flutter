import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
    hintText: 'Email',
    fillColor: Colors.grey[300],
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink, width: 2)));
