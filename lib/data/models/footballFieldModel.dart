class FootballFieldModel {
  String? id;
  String? name;
  String? description;
  String? openHours;
  String? closeHours;
  String? email;
  String? image;
  String? location;
  String? rate;
  String? workingHours;
  num? maxPrice;
  num? minPrice;

  FootballFieldModel.fromJson(Map<String, dynamic> json, this.id) {
    name = json['name'];
    description = json['description'];
    closeHours = json['closeTime'];
    openHours = json['openTime'];
    email = json['email'];
    image = json['image'];
    location = json['location'];
    rate = json['rate'];
    workingHours = json['workingDays'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
  }
}
