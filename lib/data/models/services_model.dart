

class ServicesModel {
  String? id;
  String? name;
  String? description;
  String? image;
  num? minPrice;
  num? maxPrice;

  ServicesModel.fromJson(Map<String, dynamic> json, String this.id) {
    name = json['name'];
    image = json['image'];
    description = json['description'];
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
  }
}
