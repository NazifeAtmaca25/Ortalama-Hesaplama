import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constant/sabitler.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';

class DropdownWidget<T> extends StatefulWidget {
  final T secilen;
  final ValueChanged<T?>? secilenSet;
  final List<T> list;
  const DropdownWidget({required this.secilen, required this.list,required this.secilenSet, super.key});

  @override
  State<DropdownWidget<T>> createState() => _DropdownWidgetState<T>();
}

class _DropdownWidgetState<T> extends State<DropdownWidget<T>> {
  MaterialColor renk=Sabitler.anaRenk;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: renk.shade300.withValues(alpha: 0.3),
        border: Border.all(width: 0, style: BorderStyle.none),
      ),
      child: DropdownButton<T>(
        items: widget.list
            .map(
              (harf) =>
              DropdownMenuItem(value: harf, child: Text(harf.toString())),
        )
            .toList(),
        onChanged: widget.secilenSet,
        value: widget.secilen,
      ),
    );
  }
}
