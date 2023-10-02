import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({super.key, required this.texto});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(texto,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
    );
  }
}