
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider_test/model/movie.dart';
import 'package:provider_test/service/api_service.dart';

class MovieViewModel extends ChangeNotifier{
  bool onLoading = false;
  Movie movies = Movie();

  Future<Movie> getMovie()async{
    try{
      onLoading=true;
      notifyListeners();

      var jsonMovie = await apiService.get(url: 'api?s=batman');
      if(jsonMovie!='error' && jsonMovie!='timeout'){
        log('json : $jsonMovie');
        movies = Movie.fromJson(jsonDecode(jsonMovie));

        /// set loading to off
        await Future.delayed(const Duration(seconds: 1),(){
          onLoading=false;
        });
        notifyListeners();

       return movies;
      }else{
        return throw 'error';
      }


    }catch(e){
      ///if something error
      log('error on fetch movie : $e');
      Future.delayed(const Duration(seconds: 1),()=>onLoading=false);
      notifyListeners();
      return throw 'error';
    }
  }
}