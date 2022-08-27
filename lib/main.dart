import 'package:adf_mobx_imc/imc/imc_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia do Flutter',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ImcPage(),
    );
  }
}
