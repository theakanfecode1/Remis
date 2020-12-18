class BranchNearby {
  String name;
  String street;
  String latitude;
  String longitude;
  String distance;
  String duration;

  BranchNearby(
      {this.name,
      this.street,
      this.latitude,
      this.longitude,
      this.distance,
      this.duration});

  factory BranchNearby.fromJson(Map<String,dynamic> json){
    return BranchNearby(
      name: json["name"],
      street: json["street"],
      latitude: json["latitude"].toString(),
      longitude: json["longitude"].toString(),
      distance: json["distance"],
      duration: json["duration"]
    );
  }

}

//{
//"name": "Sahvon Yaba",
//"street": "Alagomeji",
//"latitude": 6.5007059,
//"longitude": 3.3779871999999997,
//"distance": "1.0 km",
//"duration": "5 mins"
//},
