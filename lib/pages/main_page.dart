import 'package:aula_dio/pages/dados_cadastrais.dart';
import 'package:aula_dio/pages/card_page.dart';
import 'package:aula_dio/pages/list_view.dart';
import 'package:aula_dio/pages/list_view_horizontal.dart';
import 'package:aula_dio/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'image_assets.dart';
import 'list_view_h.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("main page"),),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });                
              },
              children: const [
                CardPage(),
                ImageAssets(),
                // ListViewH(),
                ListViewPage(),
                ListViewHorizontal()
              ],
            ),
          ),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                controller.jumpToPage(value);
              });
            },
            currentIndex: posicaoPagina, 
            items: const [
            BottomNavigationBarItem(label: "page1", icon: Icon(Icons.home)),            
            BottomNavigationBarItem(label: "page2", icon: Icon(Icons.add)),
            BottomNavigationBarItem(label: "page3", icon: Icon(Icons.person)),
            BottomNavigationBarItem(label: "page4", icon: Icon(Icons.list)),
          ])
        ],
      ),
    );
  }
}