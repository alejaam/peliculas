class Peliculas {
  List<Pelicula> items = new List();
  
  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ){
    if( jsonList == null) return;

    for( var item in jsonList ){
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  int id;
  int voteCount;
  double popularity;
  double voteAverage;
  String title;
  String originalTitle;
  String releaseDate;
  String originalLanguage;
  String overview;
  String posterPath;
  String backdropPath;
  List<int> genreIds;
  bool video;
  bool adult;

  Pelicula({
    this.voteCount,
    this.popularity,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    voteCount        = json['vote_count'];
    popularity       = json['popularity'] / 1;
    video            = json['video'];
    posterPath       = json['poster_path'];
    id               = json['id'];
    adult            = json['adult'];
    backdropPath     = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();
    title            = json['title'];
    voteAverage      = json['vote_average'] / 1;
    overview         = json['overview'];
    releaseDate      = json['release_date'];
  }

  getPosterImg(){
    if(posterPath == null){
      return 'https://lh3.googleusercontent.com/proxy/pd1Wm_2Lpd_c97EAfA0t1y2uzWNL8ydF6-zYn1lKjzwp2ZhuSIKdkkM73shEFvL_Cnur5DjhjcAYzcUoaWOX0MnKIapZVYKhdozEZGEQgMPB5qYC206qU_0e-po';
    }else{
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }
}
