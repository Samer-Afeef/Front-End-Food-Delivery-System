import '../../../../core/constant/api_link.dart';

import '../../../../core/class/crud.dart';


class LoginData{
  final Crud crud;
  LoginData({required this.crud});

  postData({required String email,required String password,}) async
  {
    var response = await crud.postData(ApiLink.login,{
      "email":email,
      "password":password,
    });
    return  response.fold((l) => l, (r) => r);
  }

}