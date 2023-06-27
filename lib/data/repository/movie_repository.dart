import 'dart:convert';

import 'package:flutter_assessment_test_rony/data/api/network_api_services.dart';
import 'package:flutter_assessment_test_rony/model/movie_details_model.dart';
import 'package:flutter_assessment_test_rony/model/movie_model.dart';
import 'package:flutter_assessment_test_rony/utils/app_url.dart';

class MovieRepository {
  final apiServices = NetworkApiServices();
  Future<MovieModel> getMovie(int currentPage) async {
    dynamic response = await apiServices.getApi(AppUrl.MOVIEURL + currentPage.toString());
    return movieModelFromJson(json.encode(response));
  }

  Future<MovieDetailsModel> getMovieDetails(int id) async {
    dynamic response = await apiServices.getApi(AppUrl.DETAILSURL + id.toString());
    return MovieDetailsModel.fromJson(response);
  }
}
