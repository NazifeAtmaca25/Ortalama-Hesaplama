class DataHelper {
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
