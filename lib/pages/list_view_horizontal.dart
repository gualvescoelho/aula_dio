import 'package:aula_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("oi")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
              Card(child: Image.asset(AppImages.paisagem1), elevation: 8,),
              Card(child: Image.asset(AppImages.paisagem2)),
              Card(child: Image.asset(AppImages.paisagem3)),
            ]),
          ),
          Expanded(
            flex: 3, child: Container())
        ],
      ),
    );
  }
}