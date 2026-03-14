import 'package:ortalama_hesapla/model/lesson.dart';

class DataHelper {
  static List<Lesson> tumDersler=[];
  static void dersEkle(Lesson ders){
    tumDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double tumNotlar = 0;
    double tumKrediler = 0;

    if (DataHelper.tumDersler.isEmpty) return 0;

    for (int i = 0; i < DataHelper.tumDersler.length; i++) {
      tumNotlar = tumNotlar + (DataHelper.tumDersler[i].letter * DataHelper.tumDersler[i].credit);
      tumKrediler += DataHelper.tumDersler[i].credit;
    }

    return tumNotlar / tumKrediler;
  }

  static List<String> letter = [
    'AA',
    'BA',
    'BB',
    'CB',
    'CC',
    'DC',
    'DD',
    'FD',
    'FF',
  ];

  static List<int> credit=List.generate(10, (index) => index+1).toList();

  static double getNote(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 0;
    }
  }


}
