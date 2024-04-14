import 'package:food_delivery/core/constant/api_link.dart';

import '../../../../core/class/crud.dart';


class RestaurantData{

  final Crud crud;
  RestaurantData({required this.crud});

  get()async{
    var response = await crud.getData(ApiLink.restaurant);
    return response.fold((l) => l, (r) => r);
  }
}