import 'package:flutter/material.dart';

import '../constant/sabitler.dart';
import '../helper/data_helper.dart';

class DersListesi extends StatelessWidget {
  final Function onDissmis;
  const DersListesi({required this. onDissmis,super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor renk=Sabitler.anaRenk;
    return DataHelper.tumDersler.isNotEmpty
        ? ListView.builder(
      itemCount: DataHelper.tumDersler.length,
      itemBuilder: (context, index) {
        var ders = DataHelper.tumDersler[index];
        return Dismissible(
          key: ValueKey(DataHelper.tumDersler[index]),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction){
            onDissmis(index);//içersine index ekleyerek hangisinin silindiğini parenta bildirirsin.
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ListTile(
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
          ),
        );
      },
    )
        : Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        "Lütfen dersinizi giriniz",
        style: TextStyle(color: renk, fontSize: 24),
      ),
    );
  }
}

