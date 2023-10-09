import 'package:aula_dio/pages/card_detail.dart';
import 'package:aula_dio/repositories/card_detail_repository.dart';
import 'package:flutter/material.dart';

import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null ? LinearProgressIndicator() : InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailPage(
                cardDetail: cardDetail!,
              )));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                elevation: 8,
                shadowColor: Colors.purple,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            cardDetail!.url,
                            height: 20),
                          Text(cardDetail!.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        ],
                      ),
                      Divider(color: Colors.purple),
                      Text(
                        cardDetail!.text,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: () {}, 
                        child: 
                        Text(
                          "ler mais",
                          style: TextStyle(
                            decoration: TextDecoration.underline
                          ),
                        )))
                    ], 
                  ),
                ),
                ),
            ),
          ),
        ),
      ]
    );
  }
}