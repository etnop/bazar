import 'package:flutter/material.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/model/artigo.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/model/movimento.dart';
import 'package:bazar/screens/home_screen.dart';

class FamiliaScreen extends StatefulWidget {
  @override
   _FamiliaFormState createState() =>  _FamiliaFormState();
}

class  _FamiliaFormState extends State<FamiliaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numeroController = TextEditingController();
  final _nameController = TextEditingController();
  final _stockController = TextEditingController();
  String? _selectedFamilia;
  List<Familia> _familiaOptions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Familia newFamilia = Familia(
       
        name: _nameController.text
      );

      // Print the newArtigo details to the console
      await DatabaseHelper().insertFamilia(newFamilia);
      // Reset the form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artigo Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
 
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
          
     SizedBox(width: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Guardar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _submitForm().then((_) {
                      Navigator.pop(context, true);
                    });
                  },
                  child: Text('Guardar e voltar'),
                ),
                ElevatedButton(
                  onPressed: () {

                    Navigator.pop(context, true);
                  },
                  child: Text('voltar'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _stockController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: FamiliaScreen(),
  ));
}
