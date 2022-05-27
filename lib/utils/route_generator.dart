import 'package:flutter/material.dart';
import 'package:tucan_app/models/location.dart';
import 'package:tucan_app/screens/screens.dart';
import 'package:tucan_app/screens/view_article.dart';
import 'package:tucan_app/screens/view_location.dart';

import '../models/article.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name){
      case '/': return MaterialPageRoute(builder: (_) => const LoadingScreen());
      case '/location': return MaterialPageRoute(builder: (_) =>  ViewLocation());
      case '/login': return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home': return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/article': return MaterialPageRoute(builder: (_) => ViewArticle(settings.arguments as Article
         //   Article(description: "Recuerda que realizar la EVALUACIÓN es un REQUISITO para el próximo semestre.", sId: 1.toString(), body: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.", title: "EVALUACIÓN DOCENTE ", image: "IMAGE", category: "Actividades Escolares")
          )

      );
      
      default: return MaterialPageRoute(builder: (_) => LoginScreen());

    }

  }
}