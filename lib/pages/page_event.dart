import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';
import 'package:sahabatqu/utils/helper.dart';
import 'package:sahabatqu/utils/my_webview.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> imgList = [
    "assets/acara5.jpg",
    "assets/acara4.jpeg",
    "assets/acara3.jpg",
    "assets/acara2.jpg",
    "assets/acara1.jpg",
  ];

  List<String> dateList = [
    "2022-04-23",
    "2021-05-01",
    "2020-05-10",
    "2019-05-19",
    "2018-06-03"
  ];
  List<String> urlList = [
    "https://www.instagram.com/p/CcJ1xnRJglO",
    "https://www.instagram.com/p/CNmf4X0Hhjk",
    "https://www.instagram.com/p/B_erVfTHo1N",
    "https://www.instagram.com/p/BxhNBH1J0lr",
    "https://www.instagram.com/p/BjUVKdgH_Ef",
  ];
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: theme.brightness == Brightness.dark
                ? Colors.white
                : ColorPalette.textColor,
          ),
          backgroundColor: theme.brightness == Brightness.dark
              ? ColorPalette.bgDarkColor
              : Colors.white,
          elevation: 0,
          title: Text(
            "Kegiatan",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        itemCount: imgList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
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
                                offset:
                                    Offset(0, 4), // changes position of shadow
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
          );
        },
      ),
    );
  }
}
