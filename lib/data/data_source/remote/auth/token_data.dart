import '../../../../core/constant/api_link.dart';

import '../../../../core/class/crud.dart';


class TokenData{
  final Crud crud;
  TokenData({required this.crud});

  tokenUpdate({required String customerId,required String token,}) async
  {
    var response = await crud.postData(ApiLink.tokenUpdate,{
      "customerId": customerId,
      "notificationToken": token
    });
    return  response.fold((l) => l, (r) => r);
  }

}