import 'dart:convert';
import 'dart:io';

import 'package:flutflix/abstract_and_constants/constants.dart';
import 'package:flutflix/models/movie.dart';
import 'package:flutflix/models/tv_series_popular.dart';

import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
      static const _tvSeriesUrl = 
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened trending');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened top rate');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened upcoming');
    }
  }


Future<List<TvSeries>> getPopularTvSeries() async {
 

  try {
    final response = await http.get(Uri.parse(_tvSeriesUrl));
    
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body)['results'];
      return decodedData.map((tvSeries) => TvSeries.fromJson(tvSeries)).toList();
    } else {
      // Improved error handling by including status code in the message
      throw Exception('Failed to load popular TV series, status code: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    // Handling specific network errors
    throw Exception('Network error: $e');
  } catch (e) {
    // General error handling
    throw Exception('An error occurred: $e');
  }
}

  
}

