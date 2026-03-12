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
  MaterialColor renk = Sabitler.anaRenk;
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
                                buildContainer(DataHelper.letter, secilenHarf, (
                                  String? harf,
                                ) {
                                  setState(() {
                                    secilenHarf = harf!;
                                  });
                                }),
                                buildContainer(
                                  DataHelper.credit,
                                  secilenKredi,
                                  (int? kredi) {
                                    setState(() {
                                      secilenKredi = kredi!;
                                    });
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      setState(() {
                                        dersler.add(
                                          Lesson(
                                            girilenDers,
                                            DataHelper.getNote(secilenHarf),
                                            secilenKredi.toDouble(),
                                          ),
                                        );
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
                    child: Column(
                      children: [
                        Text(
                          "${dersler.length} Ders Girildi",
                          style: TextStyle(color: renk, fontSize: 16),
                        ),
                        Text(
                          ortalamaHesapla(
                            dersler,
                          ).toStringAsFixed(2).toString(),
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
                    ),
                  ),
                ],
              ),
              Expanded(
                child: dersler.isNotEmpty
                    ? ListView.builder(
                        itemCount: dersler.length,
                        itemBuilder: (context, index) {
                          var ders = dersler[index];
                          return ListTile(
                            leading: CircleAvatar(
                              maxRadius: 25,
                              backgroundColor: renk,
                              child: Text(
                                "${(ders.letter * ders.credit).toInt()}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            title: Text(ders.name),
                            subtitle: Text(
                              "${ders.credit} Kredi ve Not Değeri ${ders.letter}",
                            ),
                          );
                        },
                      )
                    : Padding(
                        padding: EdgeInsetsGeometry.all(20),
                        child: Text(
                          "Lütfen derslerinizi giriniz",
                          style: TextStyle(color: renk, fontSize: 24),
                        ),
                      ),
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

  double ortalamaHesapla(List<Lesson> dersler) {
    double tumNotlar = 0;
    double tumKrediler = 0;

    if (dersler.isEmpty) return 0;

    for (int i = 0; i < dersler.length; i++) {
      tumNotlar = tumNotlar + (dersler[i].letter * dersler[i].credit);
      tumKrediler += dersler[i].credit;
    }

    return tumNotlar / tumKrediler;
  }
}
