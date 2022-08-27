import 'package:adf_mobx_imc/observables/list/observable_list_page.dart';
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
      debugShowCheckedModeBanner: false,
      // home: ImcPage(),
      home: const ObservableListPage(),
    );
  }
}
