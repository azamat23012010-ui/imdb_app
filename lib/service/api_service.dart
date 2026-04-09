import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:imdb_app/models/movie_model.dart';

class ApiService {
  static final String adUrl =
      'https://imdb236.p.rapidapi.com/api/imdb/top250-movies';
  static final String rapidKey =
      '43515ea0e0msh36418637c8ad649p1a359djsn300aec645c79';
  static Future<List<MovieModel>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(adUrl),
        headers: {"x-rapidapi-key": rapidKey},
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<dynamic> data = json.decode(response.body);
        return data.map((element) => MovieModel.fromJson(element)).toList();
      } else {
        throw HttpException(response.body);
      }
    } on SocketException catch (_) {
      throw SocketException("No internet connection check your mobile !");
    } on TimeoutException catch (_) {
      throw TimeoutException("Server might be down or check your Internet !");
    } on HttpException catch (_) {
      throw HttpException("Something went wrong please try again !");
    } catch (e) {
      throw Exception("try again");
    }
  }
}
