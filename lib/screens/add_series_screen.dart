import 'package:flutter/material.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/globals.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/screens/home_screen.dart';

class AddSeriesScreen extends StatelessWidget {
  final _serieController = TextEditingController();
  Future<void> setSerie(BuildContext context) async {
    serie = _serieController.text;
      
    Familia newFamilia = Familia(
       
        name: serie
      );
      // Print the newArtigo details to the console
      await DatabaseHelper().insertSerie(newFamilia);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Series'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Nova serie'),
            SizedBox(height: 20),
            TextField(
              controller: _serieController,
            ),
            ElevatedButton(
              onPressed: () {
                setSerie(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
