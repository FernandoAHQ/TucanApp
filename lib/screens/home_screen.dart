
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tucan_app/components/articleCard.dart';
import 'package:tucan_app/components/drawer.dart';
import 'package:tucan_app/config/palette.dart';
import 'package:tucan_app/providers/articlesData.dart';
import 'package:tucan_app/screens/qr_scanner.dart';

import '../models/article.dart';
import '../providers/userData.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
        String _name = "";
//List<Article> articles = [];

  List<Widget> _screens = [];

@override
  void initState() {

    context.read<ProviderArticles>().loadArticles();


     for (var i = 0; i < (5); i++) {
  //  articles.add( Article(description: "Recuerda que realizar la EVALUACIÓN es un REQUISITO para el próximo semestre.", sId: 1.toString(), body: "BODY", title: "EVALUACIÓN DOCENTE " + i.toString(), image: "IMAGE", category: "Actividades Escolares"));
  }
    _screens = [
      Column(
        children: [
          createHeader(context),
          const Expanded(child: 
           ArticleListView())
 // buildListView(context))
          ]
        //            WelcomeHeader(name: _name),

      ),
    
     const Center(
        child: QRScanner(),
      ),

      Container(
        color: Colors.amberAccent,
        child: const Text("qwerty"),
      ),

    ];
    super.initState();
  }


  

  @override
  Widget build(BuildContext context) {
 
  
    return Scaffold(
      appBar: _createAppBar(context),
      drawer:  const DrawerMenu(),
      body: _screens[_currentIndex],
      bottomNavigationBar: _createBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _createBottomNavigationBar(BuildContext context){

    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "",),
      BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "",),
      BottomNavigationBarItem(icon: Icon(Icons.school), label: "",),
      
    ],
    
    );
  }
  onTabTapped(int index){
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

   Widget buildListView(BuildContext context) {
     ProviderArticles provArts = Provider.of<ProviderArticles>(context);
    List<Article> articles = provArts.getArticles();
      print(articles.length.toString() + " Articles");
    return ListView.builder(
      
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        Article _article = articles.elementAt(index);

        return GestureDetector(
          child: ArticleCard(_article),
          onTap: () => print(_article.title),
        );
      },
    );
  }

  AppBar _createAppBar(BuildContext context){

    String? img = context.read<ProviderUserData>().data.user?.image;
    return AppBar(
      
      shape: const Border(bottom: BorderSide(color: Palette.tecBlue, width: 4)),
      elevation: 0,
      // bottomOpacity: 0,
      actions: [
          ClipRRect(
                child: FadeInImage.assetNetwork(
                  width: 35,
                  height: 35,
                  image: img ?? "",
              //    image: "",
                     // context.read<ProviderUserData>().data.user?.image ?? "",
                  placeholder:  'assets/images/profilePlaceholder.png',
                  
                ),
                borderRadius: BorderRadius.circular(90),
              ),
              const SizedBox(width: 20.0,)
      ],
      backgroundColor: Palette.tecBlue,
      
    );
  }


  Row createHeader(BuildContext context){
    final String name = context.read<ProviderUserData>().data.user!.firstName!;

    return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        width: 15.0,
      ),
      Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        children:  [
          const SizedBox(height: 20.0,),
           const Text(
            'Miércoles, 25 de Mayo',
            style:   TextStyle(color: Palette.tecGrey, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20.0,),
             Text("Bienvenido de regreso,\n"  + name ,
              style: const TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w800)),
        
          const Text(
          //  context.read<ProviderUserData>().data.department?.name ??
                "",
           // style: h4Style,
          ),

        ],
      )
    ],
          );
  }


}

class ArticleListView extends StatelessWidget {
  const ArticleListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 ProviderArticles provArts = Provider.of<ProviderArticles>(context);
    List<Article> articles = provArts.getArticles();
    print(articles.length.toString());
    return ListView.builder(
       
       itemCount: articles.length,
       itemBuilder: (BuildContext context, int index) {
         Article _article = articles.elementAt(index);

         return GestureDetector(
           child: ArticleCard(_article),
           onTap: () => print(_article.title),
         );
       },
     );
  }
}

