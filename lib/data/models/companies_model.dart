class CompaniesModel {
  String? id;
  String? name;
  String? description;
  String? email;
  String? image;
  String? rate;
  String? plumbing;

  CompaniesModel.fromJson(Map<String, dynamic> json, this.id) {
    name = json['name'];
    description = json['description'];
    email = json['email'];
    image = json['image'];
    rate = json['rate'];
    plumbing = json['plumbing'];
  }
}
