import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class DoaDetailPage extends StatefulWidget {
  final String? title;
  final String? arab;
  final String? arti;

  DoaDetailPage({
    Key? key,
    @required this.title,
    @required this.arab,
    @required this.arti,
  }) : super(key: key);
  @override
  _DoaDetailPageState createState() => _DoaDetailPageState();
}

class _DoaDetailPageState extends State<DoaDetailPage> {
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
          // backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.title!,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              widget.arab!,
              textAlign: TextAlign.end,
              style: TextStyle(
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.arti!,
            style: TextStyle(
              // color: Colors.black,
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : ColorPalette.textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
