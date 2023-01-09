import 'package:core/core.dart';
import 'package:flutter/material.dart';

class DetailDoaPage extends StatefulWidget {
  final String? title;
  final String? arab;
  final String? arti;

  const DetailDoaPage({
    Key? key,
    @required this.title,
    @required this.arab,
    @required this.arti,
  }) : super(key: key);

  @override
  State<DetailDoaPage> createState() => _DetailDoaPageState();
}

class _DetailDoaPageState extends State<DetailDoaPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : textColor),
          backgroundColor:
              theme.brightness == Brightness.dark ? bgDarkColor : Colors.white,
          elevation: 0,
          title: Text(
            widget.title!,
            style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? Colors.white
                    : textColor,
                fontWeight: FontWeight.bold),
          )),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              widget.arab!,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.arti!,
            style: TextStyle(
              color: theme.brightness == Brightness.dark
                  ? Colors.white
                  : textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
