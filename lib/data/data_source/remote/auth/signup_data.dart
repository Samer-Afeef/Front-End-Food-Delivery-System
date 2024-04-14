import '../../../../core/constant/api_link.dart';

import '../../../../core/class/crud.dart';


class SignUpData{
  final Crud crud;
  SignUpData({required this.crud});

  postData({ required String fullName,required String email,required String address, required String phone, required String password,}) async
  {
    var response = await crud.postData(ApiLink.signUp,
        {
          "fullName": fullName,
          "email": email,
          "password": password,
          "customerAddresses": [
            {
              "address": address
            }
          ],
          "customerPhoneNumbers": [
            {
              "phoneNumber": phone
            }
          ]
        }

    );
      return  response.fold((l) => l, (r) => r);
  }

}