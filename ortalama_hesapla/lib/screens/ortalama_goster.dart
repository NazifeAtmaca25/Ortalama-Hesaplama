import 'package:flutter/material.dart';

import '../constant/sabitler.dart';
import '../helper/data_helper.dart';

class OrtalamaGoster extends StatelessWidget {
  const OrtalamaGoster({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor renk = Sabitler.anaRenk;
    return  Column(
      children: [
        Text(
          "${DataHelper.tumDersler.length} Ders Girildi",
          style: TextStyle(color: renk, fontSize: 16),
        ),
        Text(
          DataHelper.ortalamaHesapla(
          ).toStringAsFixed(2),
          style: TextStyle(
            fontSize: 40,
            color: renk,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Ortalama",
          style: TextStyle(color: renk, fontSize: 16),
        ),
      ],
    );
  }
}
