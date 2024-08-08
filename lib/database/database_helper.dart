import 'dart:io';

import 'package:bazar/model/artigo.dart';
import 'package:bazar/model/familia.dart';
import 'package:bazar/model/movimento.dart';
import 'package:bazar/resourses/artigo_resouce.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'database.db');
    // print(path);
    _db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
          CREATE TABLE IF NOT EXISTS familia (
            id INTEGER  PRIMARY KEY AUTOINCREMENT,
            name TEXT
          );
   
      CREATE TABLE IF NOT EXISTS serie (
            id INTEGER  PRIMARY KEY AUTOINCREMENT,
            name TEXT
          );
CREATE TABLE IF NOT EXISTS artigo (
    id INTEGER NOT NULL PRIMARY KEY,
	name TEXT,
	familia INTEGER,
	CONSTRAINT artigo_familia_FK FOREIGN KEY (familia) REFERENCES familia(id)
);

CREATE TABLE  IF NOT EXISTS movimento (
	id INTEGER  PRIMARY KEY AUTOINCREMENT,
	artigo INTEGER,
	descricao String,
	qtd INTEGER,
	CONSTRAINT artigo_familia_FK FOREIGN KEY (artigo) REFERENCES artigo(id)
);

        ''');
    });

    return _db;
  }

  Future<void> movimentarSaida(Movimento movimento) async {
    Database? _db = await db;
    await _db!.insert('movimento', movimento.toMap());
  } 


  Future<void> insertArtigo(Artigo artigo) async {
    Database? _db = await db;
    await _db!.insert('artigo', artigo.toMap());
  } 
  Future<void> insertFamilia(Familia familia) async {
    Database? _db = await db;
    await _db!.insert('familia', familia.toMap());
  } 
  Future<void> insertSerie(Familia familia) async {
    Database? _db = await db;
    await _db!.insert('serie', familia.toMap());
  } 


  Future<Artigo> lastnumero(int familia) async {
    Database? _db = await db;
final List<Map<String, dynamic>> maps = await _db!.rawQuery('''
    SELECT *
    FROM artigo
    WHERE familia = ?
    ORDER BY id DESC
    LIMIT 1
  ''', [familia]);
 return Artigo.fromMap(maps.first);
  }
 
  Future<Familia> getSerie() async {
    Database? _db = await db;
final List<Map<String, dynamic>> maps = await _db!.rawQuery('''
    SELECT *
    FROM serie
    ORDER BY id DESC
    LIMIT 1
  ''');
  print(maps);
  if(maps.isEmpty){
    return Familia(name: "");
  }
 return Familia.fromMap(maps.first);
  }

  Future<List<Familia>> readDataFamila() async {
    final _db = await db;
    final List<Map<String, dynamic>> maps = await _db!.query('familia',  orderBy: 'name ASC'
);

    return List.generate(maps.length, (i) {
      return Familia.fromMap(maps[i]);
    });
    
  }

  Future<List<ArtigoResource>> readDataArtigos() async {
    final _db = await db;
    final List<Map<String, dynamic>> maps = await _db!.rawQuery('''
          SELECT a.id, a.name, f.name as familia,  COALESCE(SUM(m.qtd), 0) as stock 
 FROM artigo a  
left JOIN movimento m ON a.id = m.artigo
INNER JOIN familia f ON a.familia = f.id 
 Group by a.id 
    ''');

    return List.generate(maps.length, (i) {
      return ArtigoResource.fromMap(maps[i]);
    });
  }




}
