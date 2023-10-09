import 'package:aula_dio/shared/widgets/app_images.dart';
import 'package:flutter/material.dart';

class ImageAssets extends StatefulWidget {
  const ImageAssets({super.key});

  @override
  State<ImageAssets> createState() => _ImageAssetsState();
}

class _ImageAssetsState extends State<ImageAssets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.user1, height: 50,),
        Image.asset(AppImages.user2, height: 50,),
        Image.asset(AppImages.user3, height: 50,),
        Image.asset(AppImages.paisagem1, width: double.infinity),
        Image.asset(AppImages.paisagem2, height: 50,),
        Image.asset(AppImages.paisagem3, height: 50,),
      ],
      );
  }
}