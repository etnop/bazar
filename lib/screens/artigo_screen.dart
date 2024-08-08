import 'package:flutter/material.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/model/artigo.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/model/movimento.dart';
import 'package:bazar/screens/familia_screen.dart';
import 'package:bazar/screens/home_screen.dart';

class ArtigoForm extends StatefulWidget {
  @override
  _ArtigoFormState createState() => _ArtigoFormState();
}

class _ArtigoFormState extends State<ArtigoForm> {
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

    getfamilias();
  }
  Future<void> _navigateToFamiliaForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FamiliaScreen()),
    );
      print(result);
    if (result == true) {
      getfamilias(); // Atualiza os dados se o resultado for verdadeiro
    }
  }
  Future<void> getfamilias() async {
    try {
      List<Familia> value = await DatabaseHelper().readDataFamila();
      print(value);
      setState(() {
        _familiaOptions = value;
      });
    } catch (error) {
      print(error.toString());
    }
  }

  int parseInt(String text) {
    try {
      return int.parse(text);
    } catch (e) {
      print("Error: $e");
      // Handle the error (e.g., return a default value or show a message to the user)
      return 0; // or any default value or error handling
    }
  }

  Future<void> setnumero() async {
    try {
      int numero = parseInt(_selectedFamilia ?? '');
      print(numero);
      await DatabaseHelper().lastnumero(numero);
      Artigo value = await DatabaseHelper().lastnumero(numero);
      print(value);
      setState(() {
        _numeroController.text = ((value.id ?? 0) + 1).toString();
      });
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Artigo newArtigo = Artigo(
        id: parseInt(_numeroController.text),
        name: _nameController.text,
        familia: _selectedFamilia!,
      );

      // Print the newArtigo details to the console
      await DatabaseHelper().insertArtigo(newArtigo).then((_) async {
        Movimento movimento = Movimento(
            artigo: newArtigo.id ?? 0,
            descricao: 'Stock inicial',
            qtd: parseInt(_stockController.text));
        await DatabaseHelper().movimentarSaida(movimento).then((_) {
          setState(() {
            _selectedFamilia = null;
          });
        });
      });
      // Reset the form
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Artigo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _numeroController,
                decoration: InputDecoration(labelText: 'numero'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
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
              Row(children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedFamilia,
                    decoration: InputDecoration(labelText: 'Familia'),
                    items: _familiaOptions.map((Familia value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Text(value.name),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedFamilia = newValue;
                      });
                      setnumero();
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a familia';
                      }
                      return null;
                    },
                  ),
                ),
               IconButton(
                  iconSize: 50,
                  icon: const Icon(Icons.add_link),
                  onPressed:_navigateToFamiliaForm,
                  
                ),
                SizedBox(width: 10)
              ]),
              TextFormField(
                controller: _stockController,
                decoration: InputDecoration(labelText: 'Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter stock';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid integer';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
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
    home: ArtigoForm(),
  ));
}
