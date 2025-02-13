import 'package:flutter/material.dart';
import 'package:matrimonial_app/project/homepage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main()async {


  // final dbPath = await getDatabasesPath();
  // final path = join(dbPath, 'users.db');
  // await deleteDatabase(path); // Delete the database

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,

      title: 'Matrimonial',



      home: Homepage(),
    );
  }
}

