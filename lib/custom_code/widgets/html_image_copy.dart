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

class HtmlImageCopy extends StatefulWidget {
  const HtmlImageCopy({
    Key? key,
    this.width,
    this.height,
    this.base64Image,
    this.borde,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? base64Image;
  final double? borde;

  @override
  _HtmlImageState createState() => _HtmlImageState();
}

class _HtmlImageState extends State<HtmlImageCopy> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageWidth = widget.width ?? constraints.maxWidth;
        double imageHeight = widget.height ?? constraints.maxHeight;
        double borderRadius = widget.borde ?? 0;

        return Container(
          width: imageWidth,
          height: imageHeight,
          child: FutureBuilder<Uint8List>(
            future: decodeBase64Image(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar a imagem'));
              } else {
                Uint8List imageBytes = snapshot.data!;

                return imageBytes.isNotEmpty
                    ? ClipPath(
                        clipper: HexagonalClipper(borderRadius),
                        child: Image.memory(
                          imageBytes,
                          fit: BoxFit.cover,
                        ),
                      )
                    : SizedBox();
              }
            },
          ),
        );
      },
    );
  }

  Future<Uint8List> decodeBase64Image() async {
    return await compute(base64Decode, widget.base64Image!);
  }
}

class HexagonalClipper extends CustomClipper<Path> {
  final double borderRadius;

  HexagonalClipper(this.borderRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double radius = size.width / 2;
    Offset center = Offset(size.width / 2, size.height / 2);

    path.addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(HexagonalClipper oldClipper) {
    return borderRadius != oldClipper.borderRadius;
  }
}
