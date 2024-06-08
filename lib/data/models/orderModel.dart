class OrderModel {
  String? id;
  String? userId;
  String? info;
  String? location;
  String? serviceId;
  String? serviceName;
  String? timeFrom;
  String? image;
  bool? isAccept;

  OrderModel.fromJson(Map<String, dynamic> json, this.id) {
    info = json['info'];
    userId = json['userId'];
    location = json['location'];
    serviceId = json['serviceId'];
    serviceName = json['serviceName'];
    timeFrom = json['timeFrom'];
    isAccept = json['isAccept'];
    image = json['image'];
  }
}
