import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutflix/abstract_and_constants/constants.dart';
import 'package:flutflix/models/actors.dart'; 

class MovieService {
  Future<List<Actor>> fetchCredits(int id,) async {
    final String url = 'https://api.themoviedb.org/3/movie/$id/credits?api_key=${Constants.apiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final List actorsData = decodedData["cast"] as List;


      return actorsData.map((actorJson) => Actor.fromJson(actorJson)).toList();
    } else {
      throw Exception('Failed to fetch credits for movie ID: $id');
    }
  }
}
