import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter1_a_l/features/app/manger/color_manger.dart';

class ImageDetails extends StatelessWidget {
  final String imgurl;

  const ImageDetails({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.mgrey,
      appBar: AppBar(
        title: Text('image Details'),
      ),
      body: Hero(
        tag: imgurl,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(imgurl),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: NetworkImage(imgurl),
          //     fit: BoxFit.contain,
          //   ),
          //   color: Mycolor.mgrey,
          // ),
        ),
      ),
    );
  }
}
