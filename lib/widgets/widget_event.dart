import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/pages/page_event.dart';
import 'package:sahabatqu/utils/helper.dart';
import 'package:sahabatqu/utils/my_webview.dart';

class EventWidget extends StatefulWidget {
  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  List<String> imgList = [
    "assets/acara3.jpg",
    "assets/acara2.jpg",
    "assets/acara1.jpg"
  ];

  List<String> dateList = ["2020-05-10", "2019-05-19", "2018-06-03"];
  List<String> urlList = [
    "https://www.instagram.com/p/B_erVfTHo1N/?igshid=abe36a3so2zb",
    "https://www.instagram.com/p/BxhNBH1J0lr/?igshid=rp7s57rsnz8j",
    "https://www.instagram.com/p/BjUVKdgH_Ef/?igshid=1ou83v5kn6q0e",
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Kegiatan",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: theme.brightness == Brightness.dark
                        ? Colors.white
                        : ColorPalette.textColor),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EventPage();
                  }));
                },
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(
                    color: ColorPalette.themeColor,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 240,
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyWebview(
                          title: "@sahabat.azzikra",
                          url: urlList[index],
                        );
                      }));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            imgList[index],
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.65),
                                      spreadRadius: 20,
                                      blurRadius: 30,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15)),
                                  // color: Colors.black54
                                ),
                                child: Center(
                                    child: Text(
                                  MyHelper.formatDate(
                                      DateTime.parse(dateList[index])),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
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
        ),
      ],
    );
  }
}
