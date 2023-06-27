// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/controller/movie_controller.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';
import 'package:flutter_assessment_test_rony/view/details_view.dart';
import 'package:get/get.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final controller = Get.put(MovieController());

  bool isEditing = false;
  TextEditingController searchController = TextEditingController();

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
      if (!isEditing) {
        searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF242444),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Text("Movie Page"),
            // GestureDetector(
            //   onTap: toggleEditing,
            //   child:
            //       controller.isEditing ? TextFormField() : Text('Title Text'),
            // ),

            !isEditing
                ? const Text("Movie Page")
                : Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search by name",
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.white)
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          controller.loading.value = true;
                          if (value == "") {
                            controller.filterTvShows = controller.tvShows!;
                          } else {
                            controller.filterTvShows = controller.tvShows!
                                .where((tvShow) => tvShow.name!
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          }
                          controller.loading.value = false;
                        });
                      },
                    ),
                  ),

            IconButton(
              onPressed: () {
                toggleEditing();
              },
              icon: isEditing ? const Icon(Icons.close) : const Icon(Icons.search),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF242444),
      ),
      body: GetBuilder<MovieController>(
        builder: (controller) {
          return controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: controller.scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.filterTvShows!.length,
                  padding: EdgeInsets.only(
                    top: Diamentions.height10,
                  ),
                  itemBuilder: (context, index) {
                    if (index == controller.filterTvShows!.length - 1 &&
                        controller.isMoreDataAvailable.value == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsView(
                              id: controller.filterTvShows![index].id
                                  .toString(),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Diamentions.widtht10,
                            right: Diamentions.widtht10,
                            bottom: Diamentions.height10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 75,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          controller.filterTvShows![index]
                                              .imageThumbnailPath
                                              .toString(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Diamentions.widtht10,
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.filterTvShows![index].name
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Diamentions.font16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Diamentions.height5,
                                      ),
                                      Text(
                                        controller
                                            .filterTvShows![index].network!
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Diamentions.font14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white24,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
