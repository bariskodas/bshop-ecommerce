import 'dart:convert';
import 'dart:math';

import '../models/product_model.dart';
import '../models/user_model.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  final String _apiURL = "https://fakestoreapi.com/";
  final String _userApiUrl = "https://jsonplaceholder.typicode.com/users/";
  
  
  

Future<List<ProductModel>> getProducts() async{
  
  http.Response response = await http.get(Uri.parse(_apiURL+"products"));

  if(response.statusCode==200){
    final List productDatas = jsonDecode(response.body);
      return productDatas.map((e) => ProductModel.fromJson(e)).toList();

  }else{
    throw("Something went wrong: "+response.statusCode.toString());
  }
}

Future<UserModel> getRandomUser() async{
 int userNo = Random().nextInt(10) + 1; // 1-10
  http.Response response = await http.get(Uri.parse(_userApiUrl+userNo.toString()));
  if(response.statusCode==200){
    UserModel user = UserModel.fromJson(jsonDecode(response.body));
    return user;
  }else{
    throw("Something went wrong: "+response.statusCode.toString());
  }
}

}