import 'package:flutter_assessment_test_rony/data/api/network_api_services.dart';
import 'package:flutter_assessment_test_rony/model/movie_details_model.dart';
import 'package:flutter_assessment_test_rony/utils/app_url.dart';

class MovieDetailsRepository {

  final apiServices = NetworkApiServices();
  
  Future<MovieDetailsModel> getMovieDetails(String id) async {
    dynamic response = await apiServices.getApi(AppUrl.DETAILSURL + id.toString());
    return MovieDetailsModel.fromJson(response);
  }
}
