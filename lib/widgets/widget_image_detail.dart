import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailWidget extends StatefulWidget {
  final String? image;
  ImageDetailWidget({this.image});
  @override
  _ImageDetailWidgetState createState() => _ImageDetailWidgetState();
}

class _ImageDetailWidgetState extends State<ImageDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: PhotoView(
              loadingBuilder: (context, event) => Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              ),
              imageProvider: AssetImage(widget.image!),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 40),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
