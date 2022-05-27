class Location {
  late String sId;
  late String name;
  late bool isBuilding;
  late String description;
  late String image;
  //late List<String> photos;
  late String map;
  late String especialidad;
  late String body;

  Location({
    required this.sId,
    required this.name,
    required this.image,
    required this.description,
    required this.map,
    required this.body

  }); 

  Location.fromJson(Map<String, dynamic> json) {
    
    sId = json['_id'];
    description = json['description'];
    body = json['body'];
    image = json['image'];
    map = json['map'];
  }

}

