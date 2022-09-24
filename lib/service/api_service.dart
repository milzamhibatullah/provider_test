import 'dart:async';

import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = 'https://fake-movie-database-api.herokuapp.com/';

  Future<String> get({
    String? url,
  }) async {
    try{
      var client = http.Client();
      var response = await client
          .get(Uri.parse(baseUrl + url!.toString()),)
          .timeout(const Duration(seconds: 30),);
      if(response.statusCode==200){
        return response.body;
      }else{
        throw 'error';
      }
    }on TimeoutException{
      throw 'timout';
    }
  }
}

final apiService = ApiService();
