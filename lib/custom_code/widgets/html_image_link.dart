// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';
import 'dart:convert';
import 'package:flutter/foundation.dart'; // Add this import statement for compute

class HtmlImageLink extends StatefulWidget {
  const HtmlImageLink({
    Key? key,
    this.width,
    this.height,
    this.imageUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? imageUrl;

  @override
  _HtmlImageLinkState createState() => _HtmlImageLinkState();
}

class _HtmlImageLinkState extends State<HtmlImageLink> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageWidth = widget.width ?? constraints.maxWidth;
        double imageHeight = widget.height ?? constraints.maxHeight;

        return Container(
          width: imageWidth,
          height: imageHeight,
          child: FutureBuilder<ImageProvider>(
            future: loadImage(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Image.network(
                  'https://i0.wp.com/thinkfirstcommunication.com/wp-content/uploads/2022/05/placeholder-1-1.png?fit=1200%2C800&ssl=1',
                  width: imageWidth,
                  height: imageHeight,
                );
              } else {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.saturation,
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image(image: snapshot.data!),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Future<ImageProvider> loadImage() async {
    final imageUrl = widget.imageUrl;
    return NetworkImage(imageUrl!);
  }
}
