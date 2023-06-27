import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/controller/movie_details_controller.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';
import 'package:flutter_assessment_test_rony/widgets/app_button.dart';
import 'package:flutter_assessment_test_rony/widgets/expandable_text_widget.dart';
import 'package:flutter_assessment_test_rony/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsView extends StatefulWidget {
  final String id;
  const DetailsView({super.key, required this.id});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final detailsController = Get.put(DetailsController());

  @override
  void initState() {
    super.initState();
    detailsController.getMovieDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
        backgroundColor: const Color(0xFF242444),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<DetailsController>(
          builder: (controller) {
            return controller.detailsloading.value
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: Diamentions.height10),
                        height: 300,
                        width: double.maxFinite,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 0,
                              child: SizedBox(
                                height: 200,
                                child: CarouselSlider(
                                  items: controller
                                      .details.value.tvShow!.pictures!
                                      .map((image) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(image),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    aspectRatio: 17 / 9,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    viewportFraction: 0.7,
                                    enableInfiniteScroll: true,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 150,
                              left: 20,
                              child: Container(
                                height: 130,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      controller.details.value.tvShow!.imagePath
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 200,
                              left: 120,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SmallText(
                                    text: controller.details.value.tvShow!.name
                                        .toString(),
                                    size: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(double.parse(controller.details.value.tvShow!.rating!).toStringAsFixed(1), style: TextStyle(fontSize: Diamentions.font16),),
                                      

                                      Icon(
                                        Icons.star,
                                        size: Diamentions.icon20,
                                        color: Colors.amberAccent
                                      ),

                                      SmallText(
                                        text:
                                            " (${controller.details.value.tvShow!.ratingCount}) ",
                                        size: 16,
                                      ),
                                      
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SmallText(
                                        text: controller
                                            .details.value.tvShow!.network
                                            .toString(),
                                      ),
                                      SizedBox(
                                        width: Diamentions.widtht10,
                                      ),
                                      Text(
                                        "(${controller.details.value.tvShow!.country})",
                                        style: TextStyle(
                                            color: Colors.amber.shade900),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "Status: ${controller.details.value.tvShow!.status}"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Diamentions.height15,
                          left: Diamentions.widtht10,
                        ),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Diamentions.font16),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Diamentions.widtht10,
                          right: Diamentions.widtht10,
                        ),
                        child: Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: ExpandableTextWidget(
                              text: controller.details.value.tvShow!.description
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Diamentions.height15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Diamentions.widtht10,
                          right: Diamentions.widtht10,
                          top: Diamentions.height15,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: AppButton(
                                    backgroundColor: Colors.amber,
                                    title: "Website",
                                    onPresse: () {})),
                            SizedBox(
                              width: Diamentions.widtht10,
                            ),
                            Expanded(
                                child: AppButton(
                                    backgroundColor: Colors.purple,
                                    title: "Episodes",
                                    onPresse: () {})),
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}
