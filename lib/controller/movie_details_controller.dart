import 'package:flutter_assessment_test_rony/data/repository/movie_details_repo.dart';
import 'package:flutter_assessment_test_rony/model/movie_details_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final movieRepo = MovieDetailsRepository();
  final details = MovieDetailsModel().obs;

  final detailsloading = false.obs;

  void setDetails(MovieDetailsModel value) {
    details.value = value;
  }

  Future<void> getMovieDetails(String id) async {
    detailsloading.value = true;
    try {
      movieRepo.getMovieDetails(id).then((value) {
        detailsloading.value = false;
        setDetails(value);
        update();
      });
    } catch (e) {
      detailsloading.value = false;
    }
  }
}
