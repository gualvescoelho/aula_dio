import 'package:aula_dio/pages/configuracoes_page.dart';
import 'package:aula_dio/pages/login_page.dart';
import 'package:aula_dio/pages/numeros_aleatorios_page.dart';
import 'package:flutter/material.dart';

import '../../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  context: context, 
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Camera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Galeria"),
                          leading: Icon(Icons.album),
                        )
                      ],
                    );
                  });
              },
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: 
                CircleAvatar(
                  backgroundColor: Colors.white,
                child: Image.network(
                  "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                )),
                accountName: const Text("Gustavo"), 
                accountEmail: const Text("email@email.com")),
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child:const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5,),
                    Text("Dados cadastrais"),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TelaDados()
                  ));
              },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(width: 5,),
                    Text("Termos de uso e privacidade"),
                  ],
                ),
              ),
              onTap: () {
                showModalBottomSheet(context: context, 
                builder: (BuildContext bc) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Column(
                      children: [
                        Text("Termos de uso e privacidade", 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text("aaaaaaa aaaaaaaaaa aaa sdfkjn sj dnsfdjfn lskj nmfsdk sdk fmsdk mfsdkmf sldkf msldk mfsdkfl msdlk fmsdlkf msdl fmsdlkfm sdlk",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                  ),
                      ],
                    ),
                  );
                });
              },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(width: 5,),
                    Text("Gerador de números"),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (bc) => NumerosAleatoriosPage()));
               },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.album),
                    SizedBox(width: 5,),
                    Text("Configurações"),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (bc) => ConfiguracoesPage()));
               },
            ),
            const Divider(),
            const SizedBox(height: 10,),
            
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 5,),
                    Text("Sair"),
                  ],
                ),
              ),
              onTap: () {
                showDialog(context: context, 
                builder: (BuildContext bc) {
                  return AlertDialog(
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 8,
                    title: Text("Meu App", style: TextStyle(
                      fontWeight: FontWeight.bold
                      ),),
                    content: Wrap(
                        children: [
                          Text("Voce irá deslogar"),
                          Text("Deseja realmente sair?"),
                        ],
                      ),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("Não")),
                        TextButton(onPressed: () {
                          Navigator.pushReplacement(context, 
                          MaterialPageRoute(builder: (context) => LoginPage()));
                        }, child: Text("Sim"))
                      ],
                    );
                });
               },
            ),
            ],
          ),
        );
  }
}