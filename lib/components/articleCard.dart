import 'package:flutter/material.dart';
import 'package:tucan_app/config/palette.dart';

import '../models/article.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard(this.article,  { Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/ImagePlaceholder.jpg',
          image: article.image),
   //     Image.network(
   // 'https://scontent.fcjs3-1.fna.fbcdn.net/v/t39.30808-6/279890180_4761844293919482_5095836851677628008_n.png?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_eui2=AeHNGQT0P3OP-PuFbwYzG8Lmoy9dHPKLnsyjL10c8ouezPFwgk6d5_zwYCPVHfMbsPzNwEPHg7Rur2aDD94arQu8&_nc_ohc=vTjumUvNBzoAX8NBGPc&_nc_ht=scontent.fcjs3-1.fna&oh=00_AT91TXuOO4POA_qwK9HS4wXIwtmHLlM-OOlli38vPpCDxg&oe=6292D775'),
        Padding(padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(article.category, style: const TextStyle(color: Palette.tecGreyLight, fontSize: 12.0),),
        Text(article.title, style: const TextStyle(color: Palette.darkGrey, fontSize: 18.0, fontWeight: FontWeight.bold),),
        Text(article.description, style: const TextStyle(color: Palette.tecGrey, fontSize: 14.0),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            MaterialButton(onPressed: ()=>{  Navigator.pushNamed(context, '/article', arguments: article)},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
            color: Palette.tecBlue,
            child: const Text("Ver más", style: TextStyle(color: Colors.white, fontSize: 14.0,),)
            )
          ],
        ),
          ],
        ),),
        const Divider(thickness: 5.0, height: 10.0,),
      ],
    );
  }
}