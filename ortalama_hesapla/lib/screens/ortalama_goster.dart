import 'package:flutter/material.dart';

import '../constant/sabitler.dart';
import '../helper/data_helper.dart';

class OrtalamaGoster extends StatelessWidget {
  const OrtalamaGoster({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "${DataHelper.tumDersler.length} Ders Girildi",
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          DataHelper.ortalamaHesapla(
          ).toStringAsFixed(2),
          style: Sabitler.ortalamaBuyukStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaStyle,
        ),
      ],
    );
  }
}
