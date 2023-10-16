import 'package:aula_dio/services/app_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  bool receberPushNotifications = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final CHAVE_ALTURA = "CHAVE_ALTURA";
  final CHAVE_RECEBER_NOTIFICACOES = "CHAVE_RECEBER_NOTIFICACOES";
  final CHAVE_TEMA_ESCURO = "CHAVE_MODO_ESCURO";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();

    receberPushNotifications = await storage.getConfiguracoesNotificacoes();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    
    setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Configurações"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(hintText: "Nome usuário: "),
                  controller: nomeUsuarioController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Altura do usuário: "),
                  controller: alturaController,
                ),
              ),
              SwitchListTile(
                title: Text("Receber notificações"),
                value: receberPushNotifications, onChanged: (bool value) {
                setState(() {
                  receberPushNotifications = !receberPushNotifications;
                });
              }),
              SwitchListTile(
                title: Text("Tema escuro"),
                value: temaEscuro, onChanged: (bool value) {
                setState(() {
                  temaEscuro = value;
                });
              }),
              TextButton(
                child: Text("Salvar"),
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setConfiguracoesAltura(double.parse(alturaController.text) ?? 0);
                  } catch (e) {
                    await showDialog(
                      context: context, 
                      builder: (_) {
                      return AlertDialog(
                        title: Text("Meu app"),
                        content: Text("Favor informar uma altura válida!"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, 
                          child: Text("Ok"))
                        ],
                      );
                    });
                  }

                  await storage.setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                  await storage.setConfiguracoesNotificacoes(receberPushNotifications);
                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
                  Navigator.pop(context);
                }
              )
            ],
          ),
        ),),
    );
  }
}