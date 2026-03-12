import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constant/sabitler.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/lesson.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({super.key});

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  String girilenDers = "Boş";
  var formKey = GlobalKey<FormState>();
  String secilenHarf = "AA";
  int secilenKredi = 1;
  List<Lesson> dersler = [];

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
                                buildContainer(DataHelper.letter, secilenHarf),
                                buildContainer(DataHelper.credit, secilenKredi),
                                IconButton(
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      formKey.currentState!.save();
                                      setState(() {
                                        dersler.add(
                                          Lesson(
                                            girilenDers,
                                            DataHelper.getNote(secilenHarf),
                                            secilenKredi.toDouble(),
                                          ),

                                        );
                                        debugPrint("*************");
                                        debugPrint(dersler[0].name);
                                        debugPrint(dersler[0].letter.toString());
                                        debugPrint(dersler[0].credit.toString());
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Sabitler.anaRenk,
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
                  Expanded(flex: 1, child: Text("Not Ortalaması")),
                ],
              ),
              Expanded(
                child: dersler.isNotEmpty
                    ? ListView.builder(
                        itemCount: dersler.length,
                        itemBuilder: (context, index) {
                          return Text(dersler[index].name);
                        },
                      )
                    : Padding(padding: EdgeInsetsGeometry.all(20),
                    child: Text("Lütfen derslerinizi giriniz",style: TextStyle(color: Sabitler.anaRenk,fontSize: 24),)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer<T>(List<T> list, T secilen) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Sabitler.anaRenk.shade300.withValues(alpha: 0.3),
        border: Border.all(width: 0, style: BorderStyle.none),
      ),
      child: DropdownButton<T>(
        items: list
            .map(
              (harf) =>
                  DropdownMenuItem(value: harf, child: Text(harf.toString())),
            )
            .toList(),
        onChanged: (T? e) {
          setState(() {
            secilen = e!;
          });
        },
        value: secilen,
      ),
    );
  }

  TextFormField _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Dersinizin adını giriniz",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(style: BorderStyle.none, width: 0),
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade300.withValues(alpha: 0.3),
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
