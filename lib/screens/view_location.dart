

import 'package:flutter/material.dart';
import 'package:tucan_app/config/palette.dart';
import 'package:provider/provider.dart';
import 'package:tucan_app/providers/locationsData.dart';

import '../models/location.dart';

class ViewLocation extends StatelessWidget {

  ViewLocation();

  //final Location location =  HTTPService().getLocation("628fd5cab7dcc66ceba53deb") as Location;
  

  @override
  Widget build(BuildContext context) {
  final ProviderLocations provider = Provider.of<ProviderLocations>(context);

    Location location = provider.currentLocation;


    //print(location.map);
    return Scaffold(
      extendBodyBehindAppBar: true,
     // appBar: AppBar(backgroundColor: Color.fromARGB(0, 27, 57, 106), elevation: 0.0,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Palette.tecBlue,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(location.image, fit: BoxFit.cover,),
              ),
              expandedHeight: (MediaQuery.of(context).size.height * 0.3),
              pinned: true,
          ),
          SliverList(delegate: SliverChildListDelegate(
            [   
              const SizedBox(height: 10.0,),
                Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           //   Text(location.category, style: const TextStyle(color: Palette.tecBlue, fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),
              Text(location.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
             // Text(article.date.toString(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5.0,),  
              Text(location.description + "\n", style: const TextStyle(color: Palette.tecGrey, fontSize: 16.0, fontWeight: FontWeight.normal),),

          ],
          ),
        ),
        
        Container(
          //padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child:Column(
            children: [
              const Text("Estás aquí:", style:  TextStyle(color: Palette.tecBlue, fontSize: 18.0, fontWeight: FontWeight.bold),),     
              const SizedBox(height: 10.0,),
              FadeInImage.assetNetwork(
              placeholder: 'assets/images/ImagePlaceholder.jpg',
              image: location.map,
),
            ],
          )

        ),

        Container(
             padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
               Text("Descripción:", style:  TextStyle(color: Palette.tecBlue, fontSize: 18.0, fontWeight: FontWeight.bold), ),
           //   Text(location.body, style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),),
            ],
          )
        ),
              const SizedBox(height: 20.0),

        
              const SizedBox(height: 50.0,)

            ]
          ))
        ],
      )// newMethod(context),
    );
  }


}