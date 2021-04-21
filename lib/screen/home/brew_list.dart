import 'package:fire1/models/brew.dart';
import 'package:fire1/screen/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];
    brews.forEach((brew) {
      print(brew.name);
      print(brew.strenght);
      print(brew.sugars);
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
