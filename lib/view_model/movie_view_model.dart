
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider_test/model/movie.dart';
import 'package:provider_test/service/api_service.dart';

class MovieViewModel extends ChangeNotifier{
  bool _onLoading = false;
  bool get onLoading => _onLoading;
  set onLoading(bool condition)=>_onLoading=condition;
  Future<Movie> getMovie()async{
    try{
      onLoading=true;
      var jsonMovie = await apiService.get(url: 'api?s=batman');
      if(jsonMovie!='error' && jsonMovie!='timeout'){
        log('data : $jsonMovie');
      }

      Future.delayed(const Duration(seconds: 1),()=>onLoading=false);
      throw 'testing';
    }catch(e){
      ///if something error
      log('error on fetch movie : $e');
      Future.delayed(const Duration(seconds: 1),()=>onLoading=false);
      throw 'error';
    }
  }
}