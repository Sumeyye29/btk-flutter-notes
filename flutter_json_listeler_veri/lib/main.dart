import 'package:flutter/material.dart';
import 'package:flutter_json_listeler_veri/dio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App",//metadatada görünen isim
      home: Scaffold(
        appBar: AppBar(title: const Text("Liste ve Veri İşlemleri")),
        body: DioExample(),
      ),
    );
  }
}
