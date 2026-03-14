import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constant/sabitler.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/lesson.dart';
import 'package:ortalama_hesapla/screens/ders_listesi.dart';
import 'package:ortalama_hesapla/screens/dropdown_widget.dart';
import 'package:ortalama_hesapla/screens/ortalama_goster.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({super.key});

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  MaterialColor renk = Sabitler.anaRenk;
  String girilenDers = "Boş";
  var formKey = GlobalKey<FormState>();
  String secilenHarf = "AA";
  int secilenKredi = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ortalama Hesaplama", style: Sabitler.baslikStyle),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _buildTextFormField(),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropdownWidget(secilen: secilenHarf, list: DataHelper.letter,secilenSet: (harf){
                                  setState(() {
                                    secilenHarf=harf!;
                                  });
                                },),
                                DropdownWidget(secilen: secilenKredi, list: DataHelper.credit, secilenSet: (credit){
                                  setState(() {
                                    secilenKredi=credit!;
                                  });
                                }),
                                IconButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      setState(() {
                                        DataHelper.dersEkle(Lesson(
                                          girilenDers,
                                          DataHelper.getNote(secilenHarf),
                                          secilenKredi.toDouble(),
                                        ),);
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: renk,
                                    size: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: OrtalamaGoster(),
                  ),
                ],
              ),
              Expanded(
                child: DersListesi(onDissmis: (index){
                  setState(() {
                    print(index);
                    DataHelper.tumDersler.removeAt(index);
                    print(DataHelper.tumDersler);
                  });
                },)
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer<T>(
    List<T> list,
    T secilen,
    ValueChanged<T?>? secilenSet,
  ) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: renk.shade300.withValues(alpha: 0.3),
        border: Border.all(width: 0, style: BorderStyle.none),
      ),
      child: DropdownButton<T>(
        items: list
            .map(
              (harf) =>
                  DropdownMenuItem(value: harf, child: Text(harf.toString())),
            )
            .toList(),
        onChanged: secilenSet,
        value: secilen,
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      cursorColor: renk,
      decoration: InputDecoration(
        hintText: "Dersinizin adını giriniz",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(style: BorderStyle.none, width: 0),
        ),
        filled: true,
        fillColor: renk.shade300.withValues(alpha: 0.3),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen bir ders ismi giriniz";
        }
      },
      onSaved: (value) {
        girilenDers = value!;
      },
    );
  }


}
