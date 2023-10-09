import 'package:aula_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: Text("Usuario 2"), 
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?"),
              Text("08:50")
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: "Opção 1", child: Text("opção 1")),
                PopupMenuItem<String>(value: "Opção 2", child: Text("opção 2")),
                PopupMenuItem<String>(value: "Opção 3", child: Text("opção 3")),
              ];
            },
          ),
          // isThreeLine: true, 
          ),
        Image.asset(AppImages.user1),
        Divider(color: Colors.purple,),
        Image.asset(AppImages.user2),
        Divider(color: Colors.purple,),
        Image.asset(AppImages.user3),
        Divider(color: Colors.purple,),
        Image.asset(AppImages.paisagem1),
        Divider(color: Colors.purple,),
        Image.asset(AppImages.paisagem2),
        Divider(color: Colors.purple,),
        Image.asset(AppImages.paisagem3),
        Divider(color: Colors.purple,),
      ],
    );
  }
}