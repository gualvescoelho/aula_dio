import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _concluido = false;

  Tarefa(this._descricao, this._concluido);

  String get id => _id;

  String get descricao => _descricao;

  set descricao(String descricao){
    _descricao = descricao;
  }

  bool get concluido => _concluido;

  set concluido(bool concluido) {
    _concluido = concluido;
  }
  
  // String getId() {
  //   return _id;
  // }

  // String getDescricao(){
  //   return _descricao;
  // }

  // bool getConcluido(){
  //   return _concluido;
  // }

  // void setDescricao(String descricao) {
  //   _descricao = descricao;
  // }

  // void setConcluido(bool concluido){
  //   _concluido = concluido;
  // }
}