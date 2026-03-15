import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk=Colors.indigo;


  static final TextStyle baslikStyle=GoogleFonts.quicksand(fontSize: 24,fontWeight: FontWeight.bold,color: anaRenk);
  static final TextStyle courseNameStyle=GoogleFonts.quicksand(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold);
  static final TextStyle ortalamaStyle=GoogleFonts.quicksand(fontSize: 16,color: anaRenk);
  static final TextStyle ortalamaBuyukStyle=GoogleFonts.quicksand(fontSize: 40,fontWeight: FontWeight.bold,color: anaRenk);
  static final TextStyle circleStyle=GoogleFonts.quicksand(fontSize: 24,fontWeight:FontWeight.bold , color: Colors.white,);
  static final BorderRadius borderRadius=BorderRadius.circular(24);

  static final EdgeInsets genelPadding = EdgeInsets.all(8);
  static final EdgeInsets dropDownPadding=EdgeInsets.symmetric(horizontal: 15, vertical: 8);

}