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

//class HtmlImageCopyCopy extends StatefulWidget {
//  const HtmlImageCopyCopy({
//    Key? key,
//    this.width,
//    this.height,
//    this.base64Image,
//  }) : super(key: key);
//
//  final double? width;
//  final double? height;
//  final String? base64Image;
//
//  @override
//  _HtmlImageState createState() => _HtmlImageState();
//}
//
//class _HtmlImageState extends State<HtmlImageCopyCopy> {
//  @override
//  Widget build(BuildContext context) {
//    return LayoutBuilder(
//      builder: (context, constraints) {
//        double imageWidth = widget.width ?? constraints.maxWidth;
//        double imageHeight = widget.height ?? constraints.maxHeight;
//
//        return Container(
//          width: imageWidth,
//          height: imageHeight,
//          child: FutureBuilder<Uint8List>(
//            future: decodeBase64Image(),
//            builder: (context, snapshot) {
//              if (snapshot.connectionState == ConnectionState.waiting) {
//                return Center(child: CircularProgressIndicator());
//              } else if (snapshot.hasError) {
//                return Center(child: Text('Erro ao carregar a imagem'));
//              } else {
//                Uint8List imageBytes = snapshot.data!;
//
//                return imageBytes.isNotEmpty
//                    ? FittedBox(
//                        fit: BoxFit.fill,
//                        child: ColorFiltered(
//                          colorFilter: ColorFilter.mode(
//                            Colors.black,
//                            BlendMode.saturation,
//                          ),
//                          child: Image.memory(
//                            imageBytes,
//                          ),
//                        ),
//                      )
//                    : SizedBox();
//              }
//            },
//          ),
//        );
//      },
//    );
//  }
//
//  Future<Uint8List> decodeBase64Image() async {
//    return await compute(base64Decode, widget.base64Image!);
//  }
//}

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart'; // Para usar o método compute

class HtmlImageCopyCopy extends StatefulWidget {
  const HtmlImageCopyCopy({
    Key? key,
    this.width,
    this.height,
    this.base64Image,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? base64Image;

  @override
  _HtmlImageState createState() => _HtmlImageState();
}

class _HtmlImageState extends State<HtmlImageCopyCopy> {
  Future<Uint8List?> _decodeBase64Image(String base64Image) async {
    // A função que será chamada pelo compute deve ser top-level ou static.
    return compute(_decodeImage, base64Image);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageWidth = widget.width ?? constraints.maxWidth;
        double imageHeight = widget.height ?? constraints.maxHeight;

        // Certifique-se de que base64Image não seja nulo antes de prosseguir
        if (widget.base64Image == null) {
          return Center(child: Text('Imagem não disponível'));
        }

        return Container(
          width: imageWidth,
          height: imageHeight,
          child: FutureBuilder<Uint8List?>(
            future: _decodeBase64Image(widget.base64Image!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar a imagem'));
              } else {
                Uint8List? imageBytes = snapshot.data;

                return imageBytes != null && imageBytes.isNotEmpty
                    ? Image.memory(imageBytes, fit: BoxFit.fill)
                    : Center(child: Text('Imagem vazia ou inválida'));
              }
            },
          ),
        );
      },
    );
  }
}

// Esta função deve ser top-level ou static para ser usada com compute
Uint8List _decodeImage(String base64Image) {
  return base64Decode(base64Image);
}
