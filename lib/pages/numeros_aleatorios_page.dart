import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeCliques;
  final chave_numero_aleatorio = "numero_aleatorio";
  final chave_quantidade_cliques = "quantidade_cliques";
  late SharedPreferences storage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    
    setState(() {
      numeroGerado = storage.getInt(chave_numero_aleatorio);
      quantidadeCliques = storage.getInt(chave_quantidade_cliques);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Gerador de numeros aleatorios")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(numeroGerado == null ? "Nenhum numero gerado" : numeroGerado.toString(), style: TextStyle(fontSize: 22),),
              Text(quantidadeCliques == null ? "Não houve cliques" : quantidadeCliques.toString(), style: TextStyle(fontSize: 22),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            // final SharedPreferences storage = await SharedPreferences.getInstance();
    
            // await storage.remove(chave_numero_aleatorio);
            
            var random = Random();

            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            storage.setInt(chave_numero_aleatorio, numeroGerado!);
            storage.setInt(chave_quantidade_cliques, quantidadeCliques!);
        }),
      ),
    );
  }
}