class RestaurantModel {
  int? id;
  String? name;
  String? address;
  String? location;
  String? status;
  String? food;
  String? cuisine;

  RestaurantModel(
      {this.id,
        this.name,
        this.address,
        this.location,
        this.status,
        this.food,
        this.cuisine});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    location = json['location'];
    status = json['status'];
    food = json['food'];
    cuisine = json['cuisine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['location'] = location;
    data['status'] = status;
    data['food'] = food;
    data['cuisine'] = cuisine;
    return data;
  }
}