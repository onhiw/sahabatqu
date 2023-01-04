import 'package:flutter/material.dart';
import 'package:sahabatqu/constants/themes-color.dart';

class ProgramDetailPage extends StatefulWidget {
  final String? image;
  final String? content;

  ProgramDetailPage({
    Key? key,
    @required this.image,
    @required this.content,
  }) : super(key: key);
  @override
  _ProgramDetailPageState createState() => _ProgramDetailPageState();
}

class _ProgramDetailPageState extends State<ProgramDetailPage> {
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
            "Informasi Program",
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : ColorPalette.textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Image.asset(widget.image!),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.content!,
              style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? Colors.white
                      : ColorPalette.textColor,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
