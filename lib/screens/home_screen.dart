import 'package:flutter/material.dart';
import 'package:bazar/controllers/home_controller.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/globals.dart';
import 'package:bazar/model/artigo.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/model/movimento.dart';
import 'package:bazar/resourses/artigo_resouce.dart';
import 'package:bazar/screens/add_series_screen.dart';
import 'package:bazar/screens/artigo_screen.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'dart:typed_data';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  final controller = TextEditingController();
  final HomeController homeController = HomeController();

  List<ArtigoResource> dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Familia seriedb = await DatabaseHelper().getSerie();
      if (seriedb.id == null) {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddSeriesScreen()),
        );

        // Do something with the result if needed
        if (result != null) {
          // Handle the result from AddSeriesScreen
        }
      } else {
        serie = seriedb.name;
      }

      // Now you can call other initialization functions
      homeController.getPremios((value) {
        setState(() {
          dataList = value;
        });
      });
    });
  }

  Future<void> _navigateToArtigoForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ArtigoForm()),
    );
    // print(result);
    if (result == true) {
      homeController.getPremios((value) {
        setState(() {
          dataList = value;
        });
      }); // Atualiza os dados se o resultado for verdadeiro
    }
  }

  void _filterList(String query) {
    homeController.getPremios((value) {
      setState(() {
        dataList = value;
      });
    }).then((_) {
      final lowerQuery = query.toLowerCase();
      setState(() {
        dataList = dataList.where((artigo) {
          final name = artigo.id.toString();
          return name.contains(lowerQuery);
        }).toList();
      });
    });
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

  Future<void> movimentarSaida(int id) async {
    Movimento movimento = Movimento(artigo: id, descricao: 'saida', qtd: -1);

    await DatabaseHelper().movimentarSaida(movimento).then((_) {
      homeController.getPremios((value) {
        setState(() {
          dataList = value;
        });
      });
    });
  }

  Future<void> anularSaida(int id) async {
    Movimento movimento =
        Movimento(artigo: id, descricao: 'anular saida', qtd: 1);

    await DatabaseHelper().movimentarSaida(movimento).then((_) {
      homeController.getPremios((value) {
        setState(() {
          dataList = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Artigos'),
          actions: <Widget>[
            Center(
                child:
                    Text(serie)), // Centering the text vertically in the AppBar
            SizedBox(width: 16), // Adds some space before the first button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.add_circle),
                tooltip: 'Novo Artigo',
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background (primary) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
                onPressed: _navigateToArtigoForm,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(Icons.print),
                tooltip: 'Imprimir Bilhetes',
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // background (primary) color
                  foregroundColor: Colors.white, // foreground (text) color
                ),
                onPressed: () async {
                  final pdfData = await homeController.imprimir(serie);
                  await Printing.layoutPdf(
                    onLayout: (PdfPageFormat format) async => pdfData,
                  );
                },
              ),
            ),
            SizedBox(width: 16), // Adds some space after the last button
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Numero do artigo"),
              controller: controller,
              onChanged: _filterList,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double
                      .infinity, // Garante que a largura do Container seja 100%

                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Numero')),
                      DataColumn(label: Text('Descrição')),
                      DataColumn(label: Text('Familia')),
                      DataColumn(label: Text('Stock')),
                      DataColumn(label: Text('Ação')),
                    ],
                    rows: [
                      for (var item in dataList)
                        DataRow(cells: [
                          DataCell(Text(item.id.toString())),
                          DataCell(Text(item.name.toString())),
                          DataCell(Text(item.familia.toString())),
                          DataCell(Text(item.stock.toString())),
                          DataCell(Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      anularSaida(item.id ?? 0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red, // background (primary) color
                                      foregroundColor: Colors
                                          .white, // foreground (text) color
                                    ),
                                    child: Text('Anular'),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      movimentarSaida(item.id ?? 0);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .blue, // background (primary) color
                                      foregroundColor: Colors
                                          .white, // foreground (text) color
                                    ),
                                    child: Text('Saida'),
                                  )),
                            ],
                          )),
                        ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
