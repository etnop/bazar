// lib/controllers/home_controller.dart

import 'package:flutter/services.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/model/movimento.dart';
import 'package:bazar/resourses/artigo_resouce.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeController {
  List<ArtigoResource> dataList = [];

  Future<void> getPremios(Function(List<ArtigoResource>) onDataLoaded) async {
    try {
      List<ArtigoResource> value = await DatabaseHelper().readDataArtigos();
      onDataLoaded(value);
    } catch (error) {
      print(error.toString());
    }
  }

  Future<Uint8List> imprimir(String serie) async {
    final pdf = pw.Document();

    // Carregar a fonte corretamente
    final font =
        pw.Font.ttf(await rootBundle.load("fonts/open-sans.regular.ttf"));

    List<String> listasvg = await gerarSVG(serie);
    List<pw.Widget> svgWidgets = [];
    List<List<pw.Widget>> paginas = [];

    double currentTop = 0;
    double currentLeft = 0;
    double overlap = 0; // Valor de sobreposição
    int i = 1;
    int linhas = 0;

    for (var element in listasvg) {
      final svgImage = pw.SvgImage(svg: element);
      final svgContainer = pw.Positioned(
        left: currentLeft,
        top: currentTop,
        child: pw.Opacity(
          opacity: 1,
          child: pw.Container(
            width: 100,
            height: 100,
            child: svgImage,
          ),
        ),
      );
      svgWidgets.add(svgContainer);
      if (i % 5 == 0) {
        currentLeft = 0;
        currentTop += 100;
        linhas++;
      } else {
        currentLeft += 100;
      }
      if (linhas == 8 || i == listasvg.length - 1) {
        paginas.add(svgWidgets);
        svgWidgets = [];
        linhas = 0;
        currentLeft = 0; // Incrementa a posição com sobreposição
        currentTop = 0;
      }

      i++;
    }

    for (var element in paginas) {
      pdf.addPage(
        pw.Page(
          pageFormat: const PdfPageFormat(
              21.0 * PdfPageFormat.cm, 29.7 * PdfPageFormat.cm,
              marginAll: 15),
          build: (pw.Context context) {
            return pw.Stack(
              children: element,
            );
          },
        ),
      );
    }

    return pdf.save();
  }

  Future<List<String>> gerarSVG(String serie) async {
    List<ArtigoResource> value = await DatabaseHelper().readDataArtigos();
    List<String> svgRaws = [];
    String svgTemplate = "";
    try {
      final file = rootBundle.loadString("lib/assents/template.svg");
      svgTemplate = await file;
    } catch (e) {
      print("An error occurred: $e");
    }

    for (var element in value) {
      for (var i = 0; i < element.stock; i++) {
        String svgRaw = svgTemplate
            .replaceAll("#ano", serie)
            .replaceAll("#id", i.toString())
            .replaceAll("#numero", element.id.toString());
        svgRaws.add(svgRaw);
      }
    }
    return svgRaws;
  }

  void filterList(String query, List<ArtigoResource> originalDataList,
      Function(List<ArtigoResource>) onFiltered) {
    final lowerQuery = query.toLowerCase();
    List<ArtigoResource> filteredList = originalDataList.where((artigo) {
      final name = artigo.id.toString();
      return name.contains(lowerQuery);
    }).toList();
    onFiltered(filteredList);
  }

  Future<void> movimentarSaida(int id) async {
    Movimento movimento = Movimento(artigo: id, descricao: 'saida', qtd: -1);

    await DatabaseHelper().movimentarSaida(movimento);
  }

  Future<void> anularSaida(int id) async {
    Movimento movimento =
        Movimento(artigo: id, descricao: 'anular saida', qtd: 1);

    await DatabaseHelper().movimentarSaida(movimento);
  }

  Future<Familia> getSerie() async {
    return await DatabaseHelper().getSerie();
  }
}
