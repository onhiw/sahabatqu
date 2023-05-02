import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> imageList = [
    "assets/images1.JPG",
    "assets/images2.JPG",
    "assets/images3.JPG",
    "assets/images4.JPG",
    "assets/images5.JPG",
    "assets/images6.JPG",
    "assets/images7.JPG",
    "assets/images8.JPG",
    "assets/images9.JPG",
    "assets/images10.JPG",
    "assets/images11.JPG",
    "assets/images12.JPG",
    "assets/images13.JPG",
    "assets/images14.JPG",
    "assets/images15.jpg",
    "assets/images16.jpg",
    "assets/images17.jpg",
    "assets/images18.jpg",
    "assets/images19.jpg",
    "assets/images20.jpg",
    "assets/images21.jpg",
    "assets/images22.jpg",
    "assets/images23.jpg",
    "assets/images24.jpg",
    "assets/images25.jpg",
    "assets/images26.jpg",
    "assets/images27.jpg",
    "assets/images28.jpg",
    "assets/images29.jpg",
    "assets/images30.jpg",
    "assets/images31.jpg",
    "assets/images32.jpg",
    "assets/images33.jpg",
    "assets/images34.jpg",
    "assets/images35.jpg",
    "assets/images36.jpg",
    "assets/images37.jpg",
    "assets/images38.jpg",
    "assets/images39.jpg",
    "assets/images40.jpg",
    "assets/images41.jpg",
    "assets/images42.jpg",
    "assets/images43.jpg",
    "assets/images44.jpg",
    "assets/images45.jpg",
    "assets/images46.jpeg",
    "assets/images47.jpeg",
    "assets/images48.jpeg",
    "assets/images49.jpeg",
    "assets/images50.jpeg",
    "assets/images51.jpeg",
  ];

  List<String> dateList = [
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-18",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2019-05-19",
    "2020-05-09",
    "2020-05-09",
    "2020-05-09",
    "2020-05-10",
    "2020-05-10",
    "2020-05-10",
    "2021-05-10",
    "2021-05-10",
    "2021-05-10",
    "2021-05-01",
    "2021-05-01",
    "2021-05-01",
    "2021-05-01",
    "2021-05-01",
    "2021-05-01",
    "2021-05-01",
    "2021-05-09",
    "2021-05-09",
    "2021-05-09",
    "2021-05-09",
    "2021-05-09",
    "2023-04-22",
    "2023-04-22",
    "2023-04-22",
    "2023-04-22",
    "2023-04-22",
    "2023-04-22",
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor:
          theme.brightness == Brightness.dark ? bgDarkColor : Colors.grey[100],
      appBar: AppBar(
          iconTheme: IconThemeData(
            color:
                theme.brightness == Brightness.dark ? Colors.white : textColor,
          ),
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          elevation: 0,
          title: Text(
            "Gallery",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _modalBottomimages(context, index, imageList);
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: IntrinsicHeight(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            // width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 20,
                                  blurRadius: 30,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                              // color: Colors.black54
                            ),
                            child: Center(
                                child: Text(
                              MyHelper.formatDate(
                                  DateTime.parse(dateList[index])),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ))),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _modalBottomimages(
      BuildContext context, int index, List<String> imageList) {
    PageController pageController = PageController(initialPage: index);

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        context: context,
        builder: (BuildContext cn) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Scaffold(
                backgroundColor: Colors.black,
                body: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: PhotoViewGallery.builder(
                        pageController: pageController,
                        itemCount: imageList.length,
                        loadingBuilder: (context, event) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        builder: (context, index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(imageList[index]),
                            initialScale: PhotoViewComputedScale.contained * 1,
                            heroAttributes:
                                PhotoViewHeroAttributes(tag: imageList[index]),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, top: 40),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                )),
          );
        });
  }
}
