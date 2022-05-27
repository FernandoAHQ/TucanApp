import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tucan_app/models/article.dart';
import 'package:tucan_app/models/location.dart';
import '../models/article.dart';
import '../services/httpService.dart';

class ProviderLocations with ChangeNotifier {

    List<Location> articles = [];
    Location currentLocation = Location(sId: "", name: "", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD", description: "", map: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD", body: "");


      Future loadLocation(String id)  async{

        currentLocation = Location(sId: "", name: "", image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD", description: "", map: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.es%2Fpin%2F555420566554110894%2F&psig=AOvVaw1GKWS9lLoYmei6G-ZMNQyN&ust=1653687501153000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCPj1uJKQ_vcCFQAAAAAdAAAAABAD", body: "");
      
    final Response response;
    
      response = await HTTPService().requestLocation(id);
    print('GET LOCATION: ' + response.statusCode.toString());

    //  print(response.statusCode);
  if (response.statusCode == 201) {
        final Map data = jsonDecode(response.body);
        
    //     print(data['articles'][0]);
            currentLocation = Location(
          sId:       (data['location']['_id']).toString(),
          name: (data['location']['name']).toString(),
          description: (data['location']['description']).toString(),
          body:    (data['location']['body']).toString(),
          image:    (data['location']['image']).toString(),
           map:   (data['location']['map']).toString(),
          
        );
//        categories = parsedData['categories'];

         notifyListeners();
        }else{
          print("COULDNT LOAD");
        }
         notifyListeners();

      }

}