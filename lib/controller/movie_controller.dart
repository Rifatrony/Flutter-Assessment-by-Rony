import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/data/repository/movie_repository.dart';
import 'package:flutter_assessment_test_rony/model/movie_model.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final movieRepo = MovieRepository();

  final movie = MovieModel().obs;
  List<TvShow>? tvShows = <TvShow>[];
  List<TvShow>? filterTvShows = <TvShow>[];
  final loading = false.obs;

  bool isEditing = false;

  int page = 1;
  var isDataProcessing = false.obs;

  final scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;

  setLoading(bool value) {
    loading.value = value;
  }

  void setMovie(MovieModel value) {
    movie.value = value;
  }

  

  @override
  void onInit() async {
    super.onInit();
    getMovie(page);
    paginateMovie();
  }

  void paginateMovie() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreMovies(page);
        update();
      }
    });
  }

  void getMoreMovies(page) {
    try {
      movieRepo.getMovie(page).then((value) {
        if (value.pages! > 0) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          Get.snackbar("Message", "No more data found");
        }

        tvShows!.addAll(value.tvShows!);
        filterTvShows!.addAll(value.tvShows!);

        update();
      }).onError((error, stackTrace) {
        isMoreDataAvailable(false);
      });
    } catch (e) {
      isMoreDataAvailable(false);
    }
  }

  Future<void> getMovie(page) async {
    setLoading(true);
    movieRepo.getMovie(page).then((value) {
      setLoading(false);
      tvShows!.addAll(value.tvShows!);
      filterTvShows!.addAll(value.tvShows!);
      update();
    }).onError((error, stackTrace) {
      setLoading(false);
      update();
    });
    update();
  }

}

