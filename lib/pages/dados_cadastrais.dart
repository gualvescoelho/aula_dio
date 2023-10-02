import 'package:aula_dio/pages/repositories/linguagens_repository.dart';
import 'package:aula_dio/pages/repositories/nivel_repository.dart';
import 'package:aula_dio/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class TelaDados extends StatefulWidget {
  TelaDados({super.key});

  @override
  State<TelaDados> createState() => _TelaDadosState();
}

class _TelaDadosState extends State<TelaDados> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController nascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var linguagensRepository = LinguagensRepository();
  var linguagens = [];
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> returnItens(int qtdMaxima) {
    var itens = <DropdownMenuItem<int>>[];

    for(var i = 0; i < qtdMaxima; i++) {
      itens.add(DropdownMenuItem(child: Text(i.toString()), value: i));
    }
    
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meus dados"),),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando 
        ? Center(child: CircularProgressIndicator()) 
        : ListView(
          children: [
            TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            TextLabel(texto: "Data de nascimento"),
            TextField(
              readOnly: true,
              controller: nascimentoController,
              onTap: () async {
                var nascimento = await showDatePicker(context: context, 
                initialDate: DateTime(2000,1,1), 
                firstDate: DateTime(1900,1,1), 
                lastDate: DateTime(2023,10,23));
                if(nascimento != null){
                  nascimentoController.text = nascimento.toString();
                  dataNascimento = nascimento;
                }
              },
            ),
            const TextLabel(texto: "Nivel de experiencia"),
            Column(
              children: niveis.map((nivel) => RadioListTile(
              dense: true,
              title: Text(nivel.toString()),
              value: nivel, 
              selected: nivelSelecionado == nivel,
              groupValue: nivelSelecionado, 
              onChanged: (value){
                setState(() {
                  nivelSelecionado = value.toString();
                });
              })).toList()),
            const TextLabel(texto: "Linguagens Preferidas"),
            Column(
              children: linguagens
              .map((e) => CheckboxListTile(
              dense: true,
              title: Text(e),
              value: linguagensSelecionadas.contains(e), 
              onChanged: (value) {
                if (value!) {
                  setState(() {
                    linguagensSelecionadas.add(e);
                  });
                }else{
                  setState(() {
                    linguagensSelecionadas.remove(e);
                  });
                }
            })).toList(),
            ),
            TextLabel(texto: "Tempo de experiência"),
            DropdownButton(
              value: tempoExperiencia,
              isExpanded: true,
              items: returnItens(50),
              onChanged: (value) {
                setState(() {
                  tempoExperiencia = int.parse(value.toString());
                });
            }),
            TextLabel(texto: "Pretensão salarial. R\$ ${salarioEscolhido.round().toString()}"),
            Slider(
              value: salarioEscolhido, 
              min: 0, 
              max: 10000, 
              onChanged: (double value) {
                setState(() {
                  salarioEscolhido = value;
                });
              }),

            TextButton(onPressed: (){
              setState(() {
                salvando = false;
              });
              if(nomeController.text.trim().length < 3){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Erro no nome!"))
                );
                return;
              }

              if(dataNascimento == null){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Verificar data de nascimento!"))
                );
                return;
              }

              if(nivelSelecionado.trim() == ''){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Selecionar nivel!"))
                );
                return;
              }

              if(linguagensSelecionadas.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Selecionar linguagem!"))
                );
                return;
              }

              if (tempoExperiencia < 0){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Deve ter ao menos um ano de experiência!"))
                );
                return;
              }

              if(salarioEscolhido == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Informar pretensão salarial!"))
                );
                return;
              }

              setState(() {
                salvando = !salvando;
              });
              Future.delayed(Duration(seconds: 2),() {
              setState(() {
                salvando = !salvando;
              });
              Navigator.pop(context);
              });
            }, child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}