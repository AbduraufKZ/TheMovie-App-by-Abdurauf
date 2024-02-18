class TvSeries {
  dynamic id;
  String originalname;
  String posterPath;
  String overview;
  String firstAirDate;
  double voteAverage;

  TvSeries({
    required this.id,
    required this.originalname,
    required this.posterPath,
    required this.overview,
    required this.firstAirDate,
    required this.voteAverage,
  });

  factory TvSeries.fromJson(Map<String, dynamic> json) {
    return TvSeries(
      id: json["id"],
      originalname: json["original_name"] ,
      posterPath: json["poster_path"] , 
      overview: json["overview"] ,
      firstAirDate: json["first_air_date"] ,
      voteAverage: json["vote_average"].toDouble(), 
    );
  }
}
