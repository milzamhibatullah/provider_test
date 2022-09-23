class Movie {
  List<Search>? search;

  Movie({this.search});

  Movie.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <Search>[];
      json['Search'].forEach((v) {
        search!.add(Search.fromJson(v));
      });
    }else{
      search=[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (search != null) {
      data['Search'] = search!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Search {
  String? imdbID;
  String? title;
  String? year;
  String? poster;

  Search({this.imdbID, this.title, this.year, this.poster});

  Search.fromJson(Map<String, dynamic> json) {
    imdbID = json['imdbID'];
    title = json['Title'];
    year = json['Year'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['imdbID'] = imdbID;
    data['Title'] = title;
    data['Year'] = year;
    data['Poster'] = poster;
    return data;
  }
}
