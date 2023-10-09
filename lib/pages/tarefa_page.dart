import 'package:aula_dio/repositories/tarefa_repository.dart';
import 'package:flutter/material.dart';

import '../model/tarefa.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var tarefaRepository = TarefaRepository();
  var _tarefas = <Tarefa>[];
  var descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos){
      _tarefas = await tarefaRepository.listarTarefasNaoConcluidas();
    } else{
    _tarefas = await tarefaRepository.listarTarefas();
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: 
      FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext bc){
            return AlertDialog(
              title: Text("Adicionar tarefa"),
              content: TextField(
                controller: descricaoController,
                
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
                  TextButton(
                    onPressed: () async {
                      await tarefaRepository.adicionar(
                        Tarefa(
                          descricaoController.text,
                          false
                        )
                      );
                      setState(() {
                        descricaoController.text="";
                      });
                      Navigator.pop(context);
                    }, 
                    child: Text("Salvar"))
              ],
            );
          });
        }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Filtrar pelas não concluidas", style: TextStyle(fontSize: 18),),
                    Switch(value: apenasNaoConcluidos
                    , onChanged: (bool value){
                      apenasNaoConcluidos = value;
                      obterTarefas();
                      setState(() {
                        
                      });
                    })
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: _tarefas.length,
                itemBuilder: (BuildContext bc, int index) {
                  var tarefa = _tarefas[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await tarefaRepository.remove(tarefa.id);
                      obterTarefas();
                    },
                    key: Key(tarefa.id),
                    child: ListTile(
                      title: Text(tarefa.descricao),
                      trailing: Switch(onChanged: (bool value) async {
                        await tarefaRepository.alterar(tarefa.id, value);
                        obterTarefas();
                      },
                      value: tarefa.concluido,
                      ),
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}