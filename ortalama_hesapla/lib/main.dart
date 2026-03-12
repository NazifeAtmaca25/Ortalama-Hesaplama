import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constant/sabitler.dart';
import 'package:ortalama_hesapla/screens/ortalama_hesapla.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesapla(),
    );
  }
}
