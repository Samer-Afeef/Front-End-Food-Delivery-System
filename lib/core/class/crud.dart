import 'dart:convert';
import 'package:dartz/dartz.dart';
import './status_request.dart';
import '../functions/check_internet.dart';
import 'package:http/http.dart' as http;



Map<String, String> _myHeaders = {'Content-type': 'application/json; charset=UTF-8'};

class Crud {

  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: data,headers: _myHeaders
        );
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else if (response.statusCode == 404) {
          return const Left(StatusRequest.failure);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl),headers: _myHeaders);
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);

          return Right(responseBody);
        } else if (response.statusCode == 404) {
          return const Left(StatusRequest.failure);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> putData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.put(Uri.parse(linkUrl), body: data,headers: _myHeaders);
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);

          return Right(responseBody);
        } else if (response.statusCode == 404) {
          return const Left(StatusRequest.failure);
        }else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return Left(StatusRequest.serverException);
    }
  }

  Future<Either<StatusRequest, Map>> deleteData(String linkUrl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(Uri.parse(linkUrl), body: data,headers: _myHeaders);
        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);

          return Right(responseBody);
        }else if (response.statusCode == 404) {
          return const Left(StatusRequest.failure);
        } else {
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return Left(StatusRequest.serverException);
    }
  }

}
