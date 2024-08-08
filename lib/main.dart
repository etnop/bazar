import 'package:flutter/material.dart';
import 'package:bazar/database/database_helper.dart';
import 'package:bazar/screens/home_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:bazar/globals.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  // Initialize sqflite_common_ffi
  sqfliteFfiInit();
  // Set databaseFactory to use FFI
  databaseFactory = databaseFactoryFfi;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bazar',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}


